Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34661D9A5F;
	Wed,  6 May 2026 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051045; cv=none; b=gzyiQWnWkyk6YPHlLnLVkVYMc0RfI2zRwv0MYPDC5UoiThcJU8M4L1Ej41M89+T+M5rimF80eZeClS6ZJbm0np/cBZmxayycbMiJNpB6nMMcaXR2K2QJjhzav403wUgoMrz62pfh8MZzhbzfV0JLQqUXUJMxNH4WPXfILP4YzPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051045; c=relaxed/simple;
	bh=o8UO7Zdh2TNoU/53XOBYSfnPcKXSEoq4HfHDd5sHVk0=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=KMUpe4ODxVlZwKaijX/nC8oMtOVSKUWn/e/DwH7/e+KJ3yp/VNm6jDKyanudkcMVkXb5r/TDA0u5gMQpFxSYYlLtWERWvosZKAXW6jdOuqBaap0+Q0uOIO1kzocKCT7sEs6BEiOM7jci8k1V9BVDxhxueECj2xCSId/cKPuCXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bee9b024491911f1aa26b74ffac11d73-20260506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c48efb5b-5a06-4923-8d2e-a933f66c7e9a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:fd2cc8c1649fd06b3a8398ed62f9fd1a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bee9b024491911f1aa26b74ffac11d73-20260506
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1288426002; Wed, 06 May 2026 15:03:55 +0800
Message-ID: <a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
Date: Wed, 6 May 2026 15:03:52 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for
 dyn_adc_switch mode
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
To: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
X-Forwarded-Message-Id: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




-------- 转发的消息 --------
主题: 	Re: [PATCH] ALSA: hda/generic: Add mic autoswitch support for 
dyn_adc_switch mode
日期: 	Wed, 6 May 2026 14:19:14 +0800
发件人: 	Zhang Heng <zhangheng@kylinos.cn>
收件人: 	Takashi Iwai <tiwai@suse.de>




在 2026/5/5 0:25, Takashi Iwai 写道:
> On Sun, 03 May 2026 13:45:12 +0200,
> Zhang Heng wrote:
>> When auto_mic is not available but dyn_adc_switch mode is enabled
>> (e.g., on laptops with both front and rear mic jacks), this patch
>> enables automatic microphone switching based on jack detection.
>>
>> The patch includes three changes:
>>
>> 1. In check_dyn_adc_switch(): Register jack detect callbacks for
>> all input pins when dyn_adc_switch is enabled and auto_mic is
>> not available.
>>
>> 2. In call_mic_autoswitch(): Add handling for dyn_adc_switch mode
>> to check imux_pins[] for jack presence, searching from back to
>> front (last inserted wins).
>>
>> 3. In mux_select(): Notify Capture Source controls after switching
>> to sync with user-space (PulseAudio/PipeWire).
>>
>> Problem description:
>> On Ubuntu 20.04 (with older PulseAudio/PipeWire):
>> - Front mic is unplugged
>> - Plug in rear mic
>> - Jack event is reported correctly
>> - Volume control (PulseAudio/PipeWire) recognizes the rear mic
>> - But alsamixer does NOT switch to rear mic
>> - Codec also does NOT perform the switch
>>
>> The root cause is that in dyn_adc_switch mode without auto_mic,
>> the jack detect callback was not properly set up to trigger the
>> mic autoswitch. The call_mic_autoswitch() function only calls
>> mic_autoswitch_hook or snd_hda_gen_mic_autoswitch(), which rely
>> on auto_mic being enabled.
>>
>> Additionally, after mux_select() performs the switch, user-space
>> (PulseAudio/PipeWire) may not be aware of the path change,
>> causing Capture Switch to show 'off'.
>>
>> This patch fixes both issues by:
>> 1. Registering jack detect callbacks for all input pins in
>> dyn_adc_switch mode
>> 2. Notifying Capture Source controls after switching
>>
>> Tested on SN6186 codec with Ubuntu 20.04 and 25.10.
>>
>> Question to the community: Is this approach correct? Should additional
>> changes be made to handle mute state preservation, or is this purely
>> a user-space issue that requires updating PulseAudio/PipeWire?
>>
>> Testing and feedback are welcome.
> I think the basic idea is OK. We can treat the auto-mic with dynamic
> ADC switches, too.
>
> But it's not clear what's the actual intent in your code changes:
>
>
>> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
>> ---
>> sound/hda/codecs/generic.c | 82 ++++++++++++++++++++++++++++++++++++--
>> 1 file changed, 79 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
>> index 660a9f2c0ded..c536de10d8b8 100644
>> --- a/sound/hda/codecs/generic.c
>> +++ b/sound/hda/codecs/generic.c
>> @@ -27,6 +27,10 @@
>> #include "hda_beep.h"
>> #include "generic.h"
>> +/* Forward declaration */
>> +static void call_mic_autoswitch(struct hda_codec *codec,
>> + struct hda_jack_callback *jack);
>> +
>> /**
>> * snd_hda_gen_spec_init - initialize hda_gen_spec struct
>> @@ -3238,6 +3242,19 @@ static int check_dyn_adc_switch(struct 
>> hda_codec *codec)
>> if (!spec->dyn_adc_switch && spec->multi_cap_vol)
>> spec->num_adc_nids = 1;
>> + /* Enable mic autoswitch for dyn_adc_switch mode when auto_mic is 
>> not available */
>> + if (!spec->auto_mic && imux->num_items > 1) {
>> + int i;
>> + for (i = 0; i < imux->num_items; i++) {
>> + hda_nid_t pin = spec->imux_pins[i];
>> + if (!is_jack_detectable(codec, pin))
>> + continue;
>> + snd_hda_jack_detect_enable_callback(codec, pin,
>> + call_mic_autoswitch);
>> + }
>> + codec_dbg(codec, "Enable mic autoswitch for input sources\n");
>> + }
> IMO, this should be rather put at auto_mic_check_imux() instead,
> something like:
>
> @@ -4789,13 +4789,15 @@ static bool auto_mic_check_imux(struct 
> hda_codec *codec)
> const struct hda_input_mux *imux;
> int i;
> - imux = &spec->input_mux;
> - for (i = 0; i < spec->am_num_entries; i++) {
> - spec->am_entry[i].idx =
> - find_idx_in_nid_list(spec->am_entry[i].pin,
> - spec->imux_pins, imux->num_items);
> - if (spec->am_entry[i].idx < 0)
> - return false; /* no corresponding imux */
> + if (!spec->dyn_adc_switch) {
> + imux = &spec->input_mux;
> + for (i = 0; i < spec->am_num_entries; i++) {
> + spec->am_entry[i].idx =
> + find_idx_in_nid_list(spec->am_entry[i].pin,
> + spec->imux_pins, imux->num_items);
> + if (spec->am_entry[i].idx < 0)
> + return false; /* no corresponding imux */
> + }
> }
> /* we don't need the jack detection for the first pin */
>
In fact, auto_ic_check_imux cannot be executed on desktop computers at 
all. You can take a look at the check_outo_ic_availability section
for (int i = 0; i < cfg->num_inputs; i++) {
     hda_nid_t nid = cfg->inputs[i].pin;
     unsigned int attr;
     attr = snd_hda_codec_get_pincfg(codec, nid);
     attr = snd_hda_get_input_pin_attr(attr);
     if (types & (1 << attr))        For desktop computers, the rear mic 
and line are an attr, which will be directly returned here.
         return 0;  /* already occupied */
}

>> return 0;
>> }
>> @@ -4107,9 +4124,38 @@ static int mux_select(struct hda_codec *codec, 
>> unsigned int adc_idx,
>> path = get_input_path(codec, adc_idx, idx);
>> if (!path)
>> return 0;
>> - if (path->active)
>> - return 0;
>> - snd_hda_activate_path(codec, path, true, false);
>> + if (path->active) {
>> + codec_err(codec, "[MUX] mux_select: path already active, skip 
>> activate but still notify\n");
>> + } else {
>> + snd_hda_activate_path(codec, path, true, false);
>> + }
>> +
>> + /* Notify Input Source / Capture Source controls that the path has 
>> changed */
>> + if (!spec->auto_mic && spec->input_mux.num_items > 1) {
>> + struct snd_card *card = codec->card;
>> + struct snd_kcontrol *kctl;
>> + struct snd_ctl_elem_id id;
>> + int notified = 0;
>> +
>> + codec_err(codec, "[MUX] mux_select: notifying controls, 
>> num_items=%d\n", spec->input_mux.num_items);
>> +
>> + if (card) {
>> + list_for_each_entry(kctl, &card->controls, list) {
>> + if (kctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER)
>> + continue;
>> + codec_err(codec, "[MUX] mux_select: found control '%s'\n", 
>> kctl->id.name);
>> + if (strncmp(kctl->id.name, "Capture Source", 14) == 0) {
>> + id = kctl->id;
>> + snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
>> + codec_err(codec, "[MUX] mux_select: notified '%s'\n", kctl->id.name);
>> + notified = 1;
>> + }
>> + }
>> + }
>> + if (!notified)
>> + codec_err(codec, "[MUX] mux_select: no Input/Capture Source control 
>> found!\n");
>> + }
>> +
> Hmm, I can't follow the logic here. What does this code change try to
> achieve...?

If I open Alsamixer first without adding snd_ctl_notify, the ADC 
switching caused

by inserting and unplugging mic will not notify Alsamixer in real time, 
resulting

in asynchronous information and still retaining the state when it was 
opened.


I will create another patch for this notification later to prevent 
confusion in understanding.

>> if (spec->cap_sync_hook)
>> spec->cap_sync_hook(codec, NULL, NULL);
>> path_power_down_sync(codec, old_path);
>> @@ -4602,6 +4648,36 @@ static void call_mic_autoswitch(struct 
>> hda_codec *codec,
>> struct hda_jack_callback *jack)
>> {
>> struct hda_gen_spec *spec = codec->spec;
>> + const struct hda_input_mux *imux;
>> + int i;
>> +
>> + /* Handle dyn_adc_switch mode - use imux_pins[] */
>> + if (!spec->auto_mic && spec->dyn_adc_switch) {
>> + imux = &spec->input_mux;
>> + if (imux->num_items <= 1)
>> + goto fallback;
>> +
>> + codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: dyn_adc_switch 
>> mode, checking %d inputs\n", imux->num_items);
>> +
>> + /* Search from back to front (last inserted wins) */
>> + for (i = imux->num_items - 1; i >= 0; i--) {
>> + hda_nid_t pin = spec->imux_pins[i];
>> + int det = is_jack_detectable(codec, pin);
>> + int state = snd_hda_jack_detect_state(codec, pin);
>> + codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: imux[%d] 
>> pin=0x%02x, det=%d, state=%s\n",
>> + i, pin, det, state == HDA_JACK_PRESENT ? "PRESENT" : "ABSENT");
>> + if (det && state == HDA_JACK_PRESENT) {
>> + codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: switching to imux 
>> %d\n", i);
>> + mux_select(codec, 0, i);
>> + return;
>> + }
>> + }
>> + /* No jack present, keep current selection (don't switch to imux 0) */
>> + codec_err(codec, "[AUTO_MIC] call_mic_autoswitch: no jack present, 
>> keeping current\n");
>> + return;
>> + }
>> +
>> +fallback:
>> if (spec->mic_autoswitch_hook)
>> spec->mic_autoswitch_hook(codec, jack);
>> else
> Ditto. Something too complex here.
> mux_select() should handle the dynamic ADC switching, per se.
>
> And, with the auto-mic mode, the driver shouldn't expose the Capture
> Source mixer control. That said, enabling the auto-mic would have a
> clear downside for the user of PA/PW, too.

I have added a lot of debugging information here, which will be 
simplified when submitting v2 later.

