Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622659;
	b=uQBq2RAurtCpQLd3yaeZWubbn+/7qsDIP+0JNJcknDpoP0cmNfJkjQRGGwFBf2lpEP9P
	 EmNmmIli8ByNdgsh0uk3lZLnt4VxZ8cqa1vUAqyw3uWIXGbxo5DZp03WSYRQjuR5OT9X5
	 d88o09cHAkt8c/TAIC+xbjWiIJQkHYLcOL0iadKqpkofO+jAEcCw20orm2ZPZGkp4i9Ty
	 ZFwMtfF1+CcoSDDkRrE3lBBhVy0chsabI9U6dJtPVQg5uF184mjIL2AFO2bJW1O9GnSvj
	 WERRahg5m+FOLbsHOOhUkhVAYOpPQM3/qIsm9DsUv2SpKHL9e6ql9ZW1ZBNQXUsgrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
	b=rsWL9LN4dbkCboCRjlOaB9l2Om/vPWtPHKZ5+VYxS372lCD7eIHLpw+7q01+WUprVuSp
	 XsXx5/9hda7A6DXvGA11wXerX2bXPzlByw3DjsZaj/4Oeepw1TtAB6ecJqyaew6FEH9Og
	 4s3LUPQvujeoAXoGjOjJK3dGdTcsYFSR9iwTBktWlId2NH2h9KmFpV0v51foYrdNbyQn4
	 wrBRVAo9kkllM49t2v1RBzN/CVDKVhawWyGyAKUN5k6TX7F5JgwQ5XMtVHrxp8sM9udm4
	 Sm0opF2CnMxih1mGk60yQNipZGcdhdXTCd3NDfULbU+yBvs8zY+L9hx+Xh/ReYgLUHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/EGpdbR";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04A606A335
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF04A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/EGpdbR
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1406180a12.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622658; x=1795227458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
        b=E/EGpdbRuWjqN+bLHTOo1s6qhQ3TTm8RnEPIgBcvHfXgg1qeZhPVJP0UYTzYTqW2uG
         AXwi0fz5TMPIndgev1rSK0uiZ2w8pxlpaIpd6WBmYxemV3EkP//2kXrKS6wewOuGuvZk
         5vUdT8Bleow7S42YkX/AhJGKBgs75/b5hg8IqyH0NaYjT0ZvfsQdgY3Y8V8Ta5NLMovH
         2VhJqO9/GiA9ri5GEbgoXBx3M5J6JoDtuLsxK/R8UacFBQiepodjgGETzwloACxLpzcz
         iOoBTqy5KVF0sjSl5xM1uildk28/WPPL1FruKra7eRnVcr0BwqIYdNi5LSJoWONroy0Z
         t3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622658; x=1795227458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9W6lneKPSQoMSpQFwAwWd9P0BB/8MDW8wL1asVEo54=;
        b=K7wW+ifSYDqqA0miZzcaAJkDleTBo+88DbbfXf92LMxkC6enVYvJEgS8lmG4bZXRXt
         mIOVwbdkUuWgwkR3kdA/nhLUZL4rq6TPrjPLu2cu4xF7pgB1RTP8y9S1s2Kf8ETcQThG
         FdzGEYiFtT9YYtLxwVlsOgPF2xGCfV2oZmzCei0YQbnWxARiWyWKNHC7TyY6mWN74kzI
         bvn8Y11DHwRvvVcOmpeAmfrmWcSX5fbuPidXOM3Q4SVAuX4V/NfP6x+TINS0Cu0GTy3C
         ZCLgg6145wnGrc4UewYhhyNdF9fcq3/B6B+NLO6RrXbigUMfCus3pft7HdoHerU72ahG
         AydA==
X-Forwarded-Encrypted: i=1; AL+hErHih5TcRQgr/cCbm0Ni5c6GIPSRj0SbdXncR4MrxW7bCQrdmei0ROzmF9CtfjGr57f2Q/BZRuWZsVXDBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IwR921HAzlctXkP8p6OtICgmV83HGPbWMFTFV4Y17ep/F52Bc
	MQJ6u4xnKFdo3SL2C7Gbd6LafgLs0HtzatuzP6GlD56PytnFvLAUZ5mL
X-Gm-Gg: AYBFou0oL9Z2uo7rei5ItcA7JXOKMqn6fYnEcYwGyx6Jz3ij5yo4izSrxrHIj+UahX3
	qubvStdefuRPxJYKx+6KRhk12bxzhDPbAG34e4B9kbvBO+nksg2wP7TexEBDuJsE3LvxEx7T+9O
	Qt/ML8DASnlPzchI+imsmIsr8cQW394h76Kw4OzW6F2HJxRZ7F09+EjyGTyXI7E0PvzX/cSk33o
	+4df+zXYSvsSvecsXhtRzLkcAdG4/xTy54kcClP9H4zG3a003WOAaeC165e/kECEdzV/Iiwhhdh
	J3YF2MN8wFRAlemiI3yfdJgjNDFrtFkESvm4Ds0jU0HmkrW+CgLLix/bHUB4f3g6chZMr3ooL/x
	ebmsaB+NBk3nQVCFjq/i/EQLC15nHC9o7TKO+NftfmuaQT05L9/g95VPmunO3gEDKO7CRJo1pqT
	OtGrD6SRHIPLQcRuTJOVd21HEf6q/qJtH9wKrM3kO5SxqNvnaCblCbQt1k2Svc0Nb4FpGmKzZ8a
	7PbAi0MXqSzK5UVuUvl/7M90680xTmgnBQ4wJBDT/dtD1Pj/g9lZcXMVP9J6BAbstuLGefEZHv0
	k7yCzxkaIYVKo5OFjpLqpDAfw7UnRpI0fzxPSZ6kyA1Fb27qO4t4bm7rMj4sTjuxauhKpo5+/YJ
	E3bysrIADoRYD+joO6EVzjqouBIP7MfVZEO245RyY
X-Received: by 2002:a17:90b:548e:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b1b0ca8ae3mr4175037a91.37.1794622657886;
        Fri, 13 Nov 2026 18:17:37 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1baaafdadsm4330732a91.13.2026.11.13.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:17:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: SOF: control: Reject out of range volume and switch values
Date: Sat, 14 Nov 2026 11:17:30 +0900
Message-ID: <20261114021730.2349347-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_sof_volume_put() and snd_sof_switch_put() pass the user values
to the IPC put handlers without a range check. The switch handlers
store any value and send it to the firmware, so on IPC3 writing 2 or -1
to a switch reads back as 2 or 4294967295. The volume handlers convert
the value to u32 and clamp it to the end of the volume table. Writing -1
sets the maximum volume, and on 64-bit writing LONG_MIN sets the
minimum, both without an error.

Return -EINVAL for values outside the range reported by the info
callback, as snd_soc_put_volsw() does. This fixes the write_invalid
failures in mixer-test, and the event_spurious failures caused by the
events those writes generated.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3): the out of range
writes now fail with -EINVAL, in range writes still work, and the 9
mixer-test failures on the SOF controls are gone. IPC4 was not tested.
Its put handlers store the value the same way and now go through the
same check.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

 sound/soc/sof/control.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..b6497e50505b 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -30,6 +30,30 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/*
+ * Reject values outside the range the info callback reports, as
+ * snd_soc_put_volsw() does. The IPC put handlers do not check the range.
+ */
+static int sof_mixer_check_values(struct soc_mixer_control *sm,
+				  struct snd_sof_control *scontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	long max = sm->max - sm->min;
+	unsigned int i;
+
+	if (sm->platform_max && sm->platform_max < max)
+		max = sm->platform_max;
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		long val = ucontrol->value.integer.value[i];
+
+		if (val < 0 || val > max)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -38,6 +62,11 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
@@ -90,6 +119,11 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	int ret;
+
+	ret = sof_mixer_check_values(sm, scontrol, ucontrol);
+	if (ret)
+		return ret;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
-- 
2.43.0

