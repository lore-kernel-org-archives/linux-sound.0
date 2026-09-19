Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47F13FEE
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 00:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776435; cv=none; b=g7lXkDfRLj6didDe/+0xc9jyB2tNg4XzhLmEOxjexUURj621aEEB56VMWatzeLMu3AlC5yGYSBGnU4MvZ4hzfr9IYJj6eAch3pGZzlbZC3uzQGUV0oFVSTav6EKeuSkk1Q+rATN9q/8sAGzsWy1gr3uJ9yS7AVM8csg8kehZXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776435; c=relaxed/simple;
	bh=m+H9IiGjgbVmxw7kpPcgvv9LsJPSDDncK95XxpbsjCc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Fw/CcpQG45yG1jfWkVFgEA0CIBtOvy0B82fprYykdsmkNCd4g+xqgUgAhzRQfX99surig/yqE7kXWmDB+hpMNv9dhrAecayAuOycoE0f2rwZ5Pgs/SNE3z53afj3i5Ff+48wXnh1bKdE0w//aQAJdeio1WLF0i/y167Fn27F9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8kx7wpE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8kx7wpE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so8193785e9.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789776432; x=1790381232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lNllEQr9d4agc0XlnLX37IAqp2k/fyVFgNuR6/ZuNT8=;
        b=q8kx7wpEXEwrJFzsXzbjkTNCtRGiYbItlA0NzmtRjv9JgCvHEA9w9WZTrY5VusO0Lu
         IXvnuXo4tmIVO1nIaTkKkVaWDOglaMAkIhVKAOH/9i4KGueeORSQtBNobaXf7PNEU8rV
         znVr0XegxmJoX9iHwGW17DQso5Kpx83JKlaxworbMaepAjxEt396VzlLXqCPZ/EpCrc4
         C7Q6Z/IyQd+7/o4DWQeJHgKMHgEjcIdjeZ3p0SmjWX++6/9FEuwOVlGJ+hG/IShEahZN
         btITNqz/EnNQ+DLM7SZO2v8vZzU7cEl3whZrGM9wy3MvFfFEcEwSF9sBl0E4uuWjVW3F
         wO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776432; x=1790381232;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNllEQr9d4agc0XlnLX37IAqp2k/fyVFgNuR6/ZuNT8=;
        b=Z3pn6rp07RPuxQZLSSpvW97nGIFYjLF/pAOV97ZE68Qv5aOtaIFBPxGRTJOUaJwn4W
         vThORA44UX7dCVS7uGVpAYoPorvDrl1X2vOAD0azHgxLURP5gqWtULwVXA4PQMfqNpbm
         koNJ8l9Zp0vn/YcZyRhlZm5WSrO8L+99rBl5AtgS8aDdzDgb/wLHh5QkQ7pDf2aryzHc
         s9u4zXQ1LKC2GORGzF7foReOhRbyvvzjZ31zYsJKcfdIQS6+dyeRwPOIQ35SUb3jj75d
         ZhTZDQDTZo2H+7Dangx0rEN99eqU3SQ92LpgfJ+0HFvYbiwkdRPfOkBWsUOJ8sv3Lvvr
         V3Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzdZRg4MEtuUGajhcuS+0d1vPrcp8dSd+WHp5Ts1adUJ4H3Hzmb5K4+mNcDPgS2z5hJ4mPgHTbtmO8x8A==@vger.kernel.org
X-Gm-Message-State: AFuF++mOT9vZYm7+8p9kXsg/scWjM+JCTACqd2zdE2VCDXTR5jHRflLJ
	X1mfOVU/gxsLV+7Sx8m/Oyurxw+LsRTZMf/Z1R9jdvvXbJek0GWg0p7LNWQ9rKJaafg=
X-Gm-Gg: AYBFou2uBym/X6RMEYn5sr+LvkTzW7mpl3hmqQuKZkfh4qxghT+ErHZtE3Qcl7xWsEF
	8Q4vWofgdJdbwR64fed8EurZMdboZxD9+YOj76iatiShT8eb8Si5gHL5iYgmO/QHVRErOvssSqf
	fTaX09L7/ES6dKKOIZnsK8DaOPfjNnF8c45pRsawGVmYi7/ThJCFEPXEaen+0vqsbd2aTI5eZ4f
	6d20QlkSsscTa0rZ51ghSG9Z5RR8pFX64mGp441qyis/3fnBnOJELFRpvqso0psx9adGRneaUT+
	dxlp2EBxlEQD98RO6y/djTbyPU1qTJPE/MIdwwMqWgrZTwqOgJynJqwdbjWZGL3GGGZssUXytqV
	Q9gxktoB5P1CczHmfo0mNH5awxrm206hlBWRPiCkDBZoj1RPbhNDneSlU+lByvhIMmolmzlswfl
	srWqGOzQWZtI6oCFnTRFhiwKcxts05kNSg2EHYAwgAevfpAIkXVsm+sBPl8lvUMZgjxIWUJfUfE
	jRdlLWAZOuhW58829KPEaq1yOpvQUyjnjqnFNSVTzzEjHHoDnzvHWwYXHQ0CfwGGcinBsQVXyZw
	TuQZOZcHGngJsn6j5yCI
X-Received: by 2002:a05:600c:46c5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fc566e635mr53731645e9.7.1789776432153;
        Fri, 18 Sep 2026 17:07:12 -0700 (PDT)
Received: from ?IPV6:2400:adc1:1d9:bf00::3? ([2400:adc1:1d9:bf00::3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcce144b1sm48238045e9.0.2026.09.18.17.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 17:07:11 -0700 (PDT)
Message-ID: <065927dd-cabf-449a-992d-64887eedda01@gmail.com>
Date: Sat, 19 Sep 2026 05:07:09 +0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tiwai@suse.com
Cc: perex@perex.cz, linux-sound@vger.kernel.org
From: Saim Masood <s.m.saim074@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on ASUS ExpertBook PM3606CHA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The internal speakers of the ASUS ExpertBook PM3606CHA (Realtek ALC256,
PCI SSID 1043:3501) stay silent with the default codec setup, and the
headphone jack is not detected either.  The codec needs COEF values that
differ from its power-on defaults: COEF 0x10, 0x16, 0x35, 0x37 and 0x57
on NID 0x20 have to be set to the values used by the Windows driver.
Toggling the codec GPIOs, and the existing ALC256 fixups alone, make no
difference.

Apply the COEFs from a new fixup at the INIT action, so that they are
restored after resume as well.  Chain to ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
to keep the headset mic and the jack detection working, which the
fallback pin quirk provided before for this machine.

The COEF values were found by the reporter of the Ubuntu bug below, who
compared the codec state against the one under the Windows driver.

Tested on an ASUS ExpertBook PM3606CHA (BIOS PM3606CHA.304) with the
change applied to v7.2.5: with this fixup alone, the speakers, the
headphones with jack detection, and the headset mic all work, also
after suspend and resume.

Link: https://bugs.launchpad.net/bugs/2167288
Signed-off-by: Saim Masood <s.m.saim074@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8f55c3c00..f8efe6c88 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3552,6 +3552,27 @@ static void alc233_fixup_no_audio_jack(struct hda_codec *codec,
 	alc_process_coef_fw(codec, alc233_fixup_no_audio_jack_coefs);
 }
 
+static const struct coef_fw alc256_asus_speaker_coefs[] = {
+	WRITE_COEF(0x10, 0x7f20), WRITE_COEF(0x16, 0x0c50), WRITE_COEF(0x35, 0x8d6a),
+	WRITE_COEF(0x37, 0xfe06), WRITE_COEF(0x57, 0x7f7f),
+	{}
+};
+
+static void alc256_fixup_asus_speaker_coefs(struct hda_codec *codec,
+					    const struct hda_fixup *fix,
+					    int action)
+{
+	/*
+	 * The internal speakers of the ASUS ExpertBook PM3606CHA stay silent
+	 * with the default COEF values. These are the values set by the
+	 * Windows driver. They are applied on every init so that they are
+	 * restored after resume, too.
+	 */
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+	alc_process_coef_fw(codec, alc256_asus_speaker_coefs);
+}
+
 static void alc256_fixup_mic_no_presence_and_resume(struct hda_codec *codec,
 						    const struct hda_fixup *fix,
 						    int action)
@@ -4398,6 +4419,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+	ALC256_FIXUP_ASUS_SPEAKER_COEFS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7142,6 +7164,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_TXNW2781_I2C,
 	},
+	[ALC256_FIXUP_ASUS_SPEAKER_COEFS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_asus_speaker_coefs,
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7900,6 +7928,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x31e1, "ASUS B5605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x31f1, "ASUS B3605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3391, "ASUS PM3606CKA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x3501, "ASUS PM3606CHA", ALC256_FIXUP_ASUS_SPEAKER_COEFS),
 	SND_PCI_QUIRK(0x1043, 0x3601, "ASUS PM5406CGA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3611, "ASUS PM5606CGA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3701, "ASUS P5406CCA", ALC245_FIXUP_CS35L41_SPI_2),
-- 
2.55.0


