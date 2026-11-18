Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994738;
	b=qm6tT82LbNJdNGTDe60sihpojND/mf2oyXgsMSfSwSDXMbHYR5ZjwwopwwztkQJ9XoZs
	 lfxOceT/zpvUDyPwywnj4c0ArFmPYTNJX2iRBfryPsETfUWKe4OnqesGYqxf4ze+vsQpy
	 ER/YA0esGNqrRWZzWupjuMRShhUK860QCTK/NPmYimQ7RH9mqymD5tjoBYG42f6983Rv2
	 pXFgN1z5R2kOPWPq6Ws5RiG6WKfQMdmopZUX+QlWOcQ/ASX2cER+i722v7UG/efoZ0frY
	 KX47346DYgpuSxK5V/L0hYk4/C07P5kvXiBq8vqT5qmj2A8CSZMp3k9mkIzjICqxYIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
	b=DdLwyJRGLzgXssoFExw7Puq24FDSzkdiMMFMTqpTm3F5cCkYpx+0xqAPprg3dTC8rRru
	 cC7FmXPXQUZv3UPDoMNJG7FKMfWPZ3tU3vOHW1EjXGNX2KdQssUSfn2pxYQG9SgaPrz4p
	 +aUbG9j5rtpWgNKqYurrlIjnrCixWO1L+IDY+7RIlueozdzWhrbcVcATTX+ebqY6Q4y0w
	 3RkB7T9AZ+rxvfQmEcs3oc6plztaJZpaiS7awjUpjaQspXuIbZezGppZ7aXQvMyZmjkck
	 sRFCkaLmqZa2ItSNKE6Ft216+/iWjTnYZjnoNbI46FlGMBCsQVoyHOT3TPth7w36RaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0meq+bcp;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF4606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 09:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0AF4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0meq+bcp
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so1490624eec.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994737; x=1795599537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
        b=0meq+bcpbMUaOyJKi4v7OMIYhzh7dIzGJh7I1Ryp21c2d2Z7x7ar4ld8fh8p3XtlKQ
         OaJuqGQ+w7hBpL/bifgJIQ49CCcIprQ/5FRtKsK0Zz3mG/YlOyt39stsglEZP/z+Tgln
         +liPOGf2ampV77tAe9mZbq08/tPjNh0jHm0fEt1NW9edu6XHAQJwH6THhXenhItPpG4+
         XmJX+BUpEaDbN4pzNDdNtPMUQLnaBEoq/qbzbDNdlrjEhSii29Y7o75PZWu1IFdaI6+w
         58T5+lmm7gIefSl4T4AwEIvNFh80Ei0EJst5zg0oWcaAhjN7sxeD2W+exO34JcRoCvtE
         966w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994737; x=1795599537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvTmHdxE8OSRyatKP7vQR5jJ2csgl9itkqZ6bj8IuTM=;
        b=sAU8HC6Elif0AY0diwRvcu8wJ+Zb1r8vMLoA9sXZNWzLO7bX+4tHe3ehESJ+Kl69wt
         gs2CQh7v8dOyNbdjY8BSuRz6e/sXicXrahY/tDiQAFDy+u0VCxlUHP3ZnHCHBMmZ23EJ
         4Ho6V2jN2p4GOsnlnBufOMjucbcyZnNBmTTjLTWRSxDxD3aSiEbBaRIpfrfFyl4j7Qpx
         oRQMFFRXKhEwq0KBDeDretfYmWs6I0TdVyH4SU3EGv3aLFuJw0WEULiUeX+o89Xnn1bR
         KEL+R6ugHs6bP9TDwahwJc1xKtGEjYZrK1iagylvvllX7/E1f1sgrRm+BlnDE/akZlsR
         r+Qw==
X-Forwarded-Encrypted: i=1; AL+hErGy05UyIT5RLez9iWdqu6CaZw8vKzpEYctNuz/wascJJ8M8xC9p2pNE4cIBdXqsg2hzSgXlevIczplk9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d2cRiuz/xNeNRjKpwR2l992H9l/WnAJMsGwVP9tRl8vxTcT5f
	CuY/j5QSp4ZQ/1BNq1n6jH7a5G5JzVSeyBZFROdhh2hHyd0ApsJ0i/f9
X-Gm-Gg: AZFdTZfjlcyf9IXTCeuf5Z7MuigLzje00bxvmGFCV8jcYNsKLxJXOT8w8028XPH8/lI
	6/hEXVE5i/xCsAj4fNphBRtXaoBKF7xiN46CWfdCGgp5n+Yss/KbKnI+QNVVFPzRk1LjeAEiXcA
	aiFe+UPv9AetoESpXSmZGglArAHeMdELRwSyXouxU3jOKxQRuCl5qElzG4OB4FoTQGIebQTgsvI
	k+Qai+s2WGrAs+r3k6nQPYfuC7FRNdi6opiEv8hsqaH4HLfPTMO59hFYl9VxdHK95McklUnLsg8
	VhZbyZOTS6HkEAXikFkArkgjKLnBrKQyNDEi3l8Z8p/SI2MpzmGsNV91wzgL2kiWY8/Q3led8mX
	JU7k5ICcixmuOPV1houOi+Qnzr6MSdFNiLQnPcMkRnI4MIBa5VrjYRSO7BYmHSu8HHjvPDJ4uEO
	6gJQumhGcKD8saKxQyQnsL9XKrSPJx40i7yhTz+qQ702HHo8A9iumQ/dEKqFDH09+9DVdMf1+0G
	tPby80PguqNcX0Y6vr2DdnaENQUEUuP2gLNKersiXdN03oqnUw+agY7QAxU8WmErXjCV9rEGHl/
	l53P/NfGoNMh+NqNNUcnRlGXaAm6/Ye1/a2RJ46vULaDIce2KtFfy2HaOowhYx8X4TSU9gzyXAb
	FzDGr/UenSrWKulNBZIzbXqLwJFbeN/6TF6sqmy/R
X-Received: by 2002:a05:693c:42d0:b0:381:c15:1b6f with SMTP id 5a478bee46e88-3827f98c04fmr2115427eec.6.1794994736992;
        Wed, 18 Nov 2026 01:38:56 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:56 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] ASoC: SOF: control: Reject out of range volume and switch values
Date: Wed, 18 Nov 2026 18:38:40 +0900
Message-ID: <20261118093840.3514408-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118093840.3514408-1-sammiee5311@gmail.com>
References: <20261118093840.3514408-1-sammiee5311@gmail.com>
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

Return -EINVAL for values outside the range the info callbacks report,
as snd_soc_put_volsw() does. This fixes the write_invalid failures in
mixer-test, and the event_spurious failures caused by the events those
writes generated.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/sof/control.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 136e2ce15201..dcf101f7e1d5 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -26,6 +26,24 @@ static int sof_mixer_max(const struct soc_mixer_control *sm)
 	return max;
 }
 
+/* the IPC put handlers do not check the range */
+static int sof_mixer_check_values(const struct soc_mixer_control *sm,
+				  const struct snd_sof_control *scontrol,
+				  const struct snd_ctl_elem_value *ucontrol)
+{
+	int max = sof_mixer_max(sm);
+	unsigned int i;
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
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -49,6 +67,11 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
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
@@ -97,6 +120,11 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
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

