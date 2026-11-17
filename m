Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913212;
	b=Riic/shpy+FYqDjxryxHnG6VuO1GWYeWNNNfwwCVWuA5x488ChFFzV8yG57+FEswCvfE
	 uxT681zV2YJtgS2RsoR2MfBnKJq4Ha9i77LhtWEOOhFnYr4wDY14jTenvEkmc4SxUPhDh
	 Xr/1ego8/HMhQ+W/RtlSJ8snhs0X2S+AxYZT167z0ohAB7Yiqf31cistXfUJ8EZJIM4Wu
	 itCXaS7Vr9DKHGlGyhfwSKvq2vuAb26IwILnFky0QLvpSwIbQk9Ab+HdaHlTLphqj5pM4
	 aFAiG05IABPaoAw3DNMIleylwrTepawfSKWeDZAl7YAJbw0GLdkxBQCLxt1tK3qKGQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
	b=Op8i3hVetCRtoCLL41F1uH0pLjQCn9/8O+q1BOiAjBLc/nbR0A95Okt8QHd3gWmwIIOm
	 ZuOldDyX6uxzU3vv/DTlDrvq5BhAA4Abhh5HzgqRZ8kdI2nn7JSNaeb3MWTRE2p/JpQuO
	 xEy9WO8EAv5B+Henob1v1MszVA9ZAbgjz3nKou5A8eWy+vI9yGpiO9ZHeiGaJ6EXw/C/b
	 aZTJRl17NmmbjsFPKhmpO9JQXTU3Tq9/C5h23j4B0vMW6t/Kn8XWQX6AXWYCtjytrZMpC
	 jWWPSXf6wvXfBhk7oUFRveVaD60rM9B2/XNzx6+yGcypIgIZx1ZQt7lXZFQTLmNnQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvTDoFgl;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DDA606A32C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DDA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvTDoFgl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so12283502eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913211; x=1795518011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
        b=JvTDoFglgqSTIoSjwvOEZQ/Z8aysQeB6N3ZWuWE9T8Rg6ECJhSm8Ywu4/uHPIureEW
         i7bEthOpHzso7wsyCOzneDB6X65c+d7AMeK7iTyxTF3yP5mztBtnqEsOWQEYUAsZJYQ/
         TH9TEeZZD51FsqTF53HahBoBjO3zpiIyo3Q2vLDwIr/5zxHEu7hVXsqwJIGiPiQ8buu8
         96yE2Ppv3EEhv62t5wZTrof7qNBzLX4d9X1ZsJGJPna+wXsYVfyWYTW5FYcqU+KMcjhy
         9ypM6vBz6rvyHgn21APTLBQ02yzMwsQntU3i8KUxZNSyuVmgSFc9KW2hTNGBWE3Eqmx/
         CiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913211; x=1795518011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh+6CQ7ckakZkIzUsHaSg5bm3qFK+O0nTuR3w6guRzw=;
        b=RdIrG7pnKg4iMBw2igbrNmXsBJXogIevLLS/NAht65ne2ooTatl3biWybW8vQqTp5b
         u101M6r+xGDwK83OY747NZAp6oQLmF0r/vnNldzBUmiQY98hFuxczPdzgbytXH+N8mSt
         3ympjfR0yUlUlA5xiFgS0imgtBGz2tNi4JIMNB7rWbRjeWsxZfclpQSFW1ANqV9mKvPu
         CtxB9Aawen+YuCr6g8SRr4bUgGVAwXcPC9zNnQl6AFsLpiUtK816+Zkop44skf05+nyz
         o5em4069hshkB6dUgth4wgt9eOt09hYYrGLMOzMxF0jnRne8tfBPLUFM8X0pa2UiZh9O
         tYDQ==
X-Forwarded-Encrypted: i=1; AL+hErHKwUPNR9kaPQAwJkVti8gSgPOi2DxThmYiDTbJdY3fvx3P0yfGsWzwGLsFJdfB+FJ0jKf4K13NBAMUqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z90tlLkgHDCMP5X3Y02+wlYgLpnF+6aC4H8R5cTCohgVEpDYfY8
	29QUstymMBaHacdvcB+NRu7cUmrqH3FpgDWS1KfETteFoSRChaPAeQCW
X-Gm-Gg: AZFdTZcdxod276n+yRlQoB+NF+ZP3xx12QnZohs5asofyPpsrSqiAtJ377sv1g8xkRO
	aKw1PGkZ8xyKSUn1dbk7JtY8ZPX0HPqxQE6ceUTnPfJ2G/Vqe3IH/6AuvTtROJwgTkTqgJ/2kO5
	brY0ZPFLlTDJjfuIS1/cflTlOj1ZS0D+O2drDJn+cSaCKmJtJEyIIHCIaK+uTfPWkfKPa7UDBtM
	1NsxKmgCopjodmS+VNjtHqBbLytR5YZCLFI+ZYsr9SR91yFrrcT40XCgkVhE1rr9mD5u2nP84/l
	9omTbc/lRRkfW7LR0Alq0TSBRNo9UyEHGnSoZ+pncvPfTplruK8RHaEo+88+I1b/ECVn1xbfaml
	NaHtJyGX+ac9HAd3mcUZb1ksuZyjih+PJhP88Dx2uTisey1Q5hky+LHFIFUHRmW1Y1KxeJWRAiQ
	zsu99YM5amjt9ygrgJXYoQD6y0XyKexVgILOqZAtjG7UqSYnaugvpcHsmcCEYgFKO9bl3JgG/IL
	cTXO7EmM0RQ1x0AK6f+NI2DPqnSZC1Iwo66CMd133Fy5tlE995MTsrHCR0SXu7/dM1s1ZI7t9qI
	GhfCgkX61yp/aY/dwCBjXS1i8QTB+wdxD01z83QhKpPhPWKu9SbEQQmEamvISZ0tDl9W8Rb17id
	mkbqX7APy81X30jDdnKqSQosOF14usslYby7g7SBf7WmGGuY2IjMEFN9aD+Eg3Gd2Ct9VQzva3H
	QGZ1L271wFCbI6CpmisopOgnQBWIqOKEs/BXp9syml3w==
X-Received: by 2002:a05:7301:716:b0:36f:26a7:968e with SMTP id 5a478bee46e88-379681c684amr13169678eec.40.1794913208943;
        Tue, 17 Nov 2026 03:00:08 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:08 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/4] ASoC: SOF: control: reject out-of-range volume values
Date: Tue, 17 Nov 2026 16:29:47 +0530
Message-ID: <20261117105953.188645-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117105953.188645-1-kapoorarnav43@gmail.com>
References: <20261117105953.188645-1-kapoorarnav43@gmail.com>
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

snd_sof_volume_put() passes the values from user space to the IPC
volume_put() op without checking them. The IPC3 and IPC4 ops convert
each value with mixer_to_ipc(), which takes an unsigned int and clamps
anything past the end of the volume table to its last entry. A negative
value therefore sets the volume to the maximum: on a Tiger Lake laptop
with sof-hda-generic-2ch.tplg, writing -1 to "PGA2.0 2 Master Capture
Volume" (0..80, set to 50) succeeds and reads back 80.

Reject values outside 0..max, as the ALSA control API expects, before
calling the op.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..02cf59bf1f95 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -15,6 +15,21 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+static bool snd_sof_values_in_range(const struct snd_sof_control *scontrol,
+				    const struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		long value = ucontrol->value.integer.value[i];
+
+		if (value < 0 || value > scontrol->max)
+			return false;
+	}
+
+	return true;
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -39,6 +54,9 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
+	if (!snd_sof_values_in_range(scontrol, ucontrol))
+		return -EINVAL;
+
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
 
-- 
2.53.0

