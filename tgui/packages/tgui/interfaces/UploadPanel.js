import { useBackend } from "../backend";
import { Button, ProgressBar, LabeledList, Box, Section } from "../components";
import { Window } from "../layouts";

export const UploadPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const { selected_target, new_law, id, transmitting, hacked } = data;
  return (
    <Window>
      <Window.Content>
        <Section title="Silicon Law Upload">
          <LabeledList>
            <LabeledList.Item label="Selected Target">
              <Button
                disabled={transmitting}
                selected={selected_target}
                content={selected_target || 'No target selected'}
                onClick={() => act('target_select')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Selected Law">
              <Button
                disabled={transmitting}
                selected={new_law}
                content={new_law || 'No module installed'}
                onClick={() => act('law_select')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Authorization">
              <Button
                selected={id}
                content={id || (hacked ? '$@!ERR0R!@#' : 'No ID card inserted')}
                onClick={() => act('authorization')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Upload Laws">
              <Button
                disabled={!selected_target || !new_law || (!hacked && !id)}
                selected={transmitting}
                content={transmitting ? 'STOP UPLOAD' : 'START UPLOAD'}
                onClick={() => act('change_laws')}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
