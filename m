Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994734;
	b=ZEfJqcaUc825fA4cQE51NlnwPFMPP2ZN9UbnjxfRQsM0jIz3t3wQ1jZYx7K9jqCHu2ou
	 Ktvk5vPK8pZwJFa6CRouX3Tnxsek++dJdvSeGvy8Wa+KvwJ5dc4Au9UOfKAtPjp0UfOy/
	 sKAx9Q/E9kf+e8r2qIKTH/N4KHfEqxnIDWp4/k2ydkkophvx5pebIJrG1jb0frboa/U4s
	 0Vthj/HQ3aBTkUiO9uwAboADCnICDuYsMAv1vOGMcFhkgMlQbyVO7TPOHe3o4UGgJ5BRU
	 avedx194lgkr9hARwL4ZIdoZAhzUIbE0kj5KfpyM4M2Qs6d8rf9lewzZrd1IYpHM/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
	b=ztwRFSmF5OaHvhQ8s8IKhJYV0hk8+HWGqHrMBq+OtDq3NXJBNQzZ5ANMgQYx267AZMan
	 EeO+QPTnaXtGl1yxiGGqjljiejNcqBm+eMUZGdIyEgK2HgYebAFhYzdtYjQBDnL1y37U8
	 q15SMc3JVzL2L2Ss0qZ+hohWA3WDbXtHrnZerMITdfpLaTM/SlKwDUgNKJP+00NwOuu5H
	 9mpf2eq7m6tlqiuZtde1GDTpLQ9WBOTnrLjNwbsG2ieXK2AJr0wTBqgwjvpAeVmR9GkBa
	 OVjCIgqmhJDnnA4eH97DAAZ4w/lYeQJCdQT8jHLpgJPURHCRzYxscOd/zAJBemJUThg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPSVwhhj;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96813606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 09:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96813606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPSVwhhj
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40312e2so2248411eec.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994733; x=1795599533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
        b=NPSVwhhj/2xT9c86Ughcz/fq8cQwTf/6bGVdBhYheFukTdXnstjpWdarcUQisTNiup
         Ujk/l9nAsIROVq2Ib2/BuujTpbr8KdwXnsicNBlJclA28ZwJLcBuO4IXVCyGkNYofW92
         PqPvlXykpQ5LOZARG6etWQI1b3XkbQ9k70uXk8+wotzDfM0L7qfOsNmDe0L9Bx/qJvf4
         0bHobbKECPftOtl14GVvbxBRFWHoaCfYnH6brj5709HJQIsABCVIjPSqdIsgjkk+LrwC
         lJcK/6iiYo1OvfVYkc21FqjqdvyNGnmi9DUjG42haOUOUktsudJzTYyPaaW/Kny5bh1s
         1feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994733; x=1795599533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kupoLmsjeVtjcKhNtw7tTbay1eTmWzrCRIMwVpP8JgM=;
        b=M3j0V5ZT16/psOEXgYsPIKI4TmXfsZh8ekBDNt6mnWdeLoDrwXPAvNhqZvaTUnABh9
         x29T9/sSyq0NQ0LWeWnuABU/Epwp/07b0Pg3vNjpKDy4QfBkf93nmuqV/ZR+qfecU5U7
         sYYKYkIMWacvZeVA08ijcFnHLsveRZer+ofjXI4dAraYjHdPcFODG5TT03DUwb4YGucy
         AUdM4+u4BvnlothhHse2YN4Vt9JhAo5HKaIQb3ow+8x8GU/Am1uubJM/toC0KJncwvNT
         7QBB1jxNOkwaZFFAzZa4wLfL8n0BTU3EUttlN0RTRd2cUIVklqOD/SH4FkAGIkJ18x3A
         hFzw==
X-Forwarded-Encrypted: i=1; AL+hErFS6zg/TXxJGraZIWLvlI7qItZu5XPQPG5vaLFOSFj7o3zHQ1wiMXpKG09wlIDGUucIIY814sHnathSow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8P4+gWXdsDrk36ofGx6qdM6S23cWUE8bNnPwVqWeClkOVHDYdy
	4S3wdEw9KVk6ITLug5ZOTC4+DL/VAPZaV0Ves5cXa8YxdDKn6gy33OowYeOKo7eQzE8=
X-Gm-Gg: AYBFou0vEpb/SHXSNw2de7pl0rYBDO4D9i9Uk07SPzn3aG8acBTX4/vdjmbNCLRwgCj
	bcGDbFsLvM7rN2SrmKd1NbF5B4ys5mcI/G5YL/CagmyPHOXBS9c8gpwPdZJBVLscO0YoQlEbb0G
	gJxWhTa8yBtlBli5hmCKA6715JnuiO5BfzBtz6BZnBoPOCyKaKnq39qFFn0yRHQzwmfEeuIjNin
	LacziQuCuV9+UqrqBsJDdafZ6h82rSAE1bZv64GvhRTBisSPhzXMjC3ztHwkIueY2I5z8WyMbbh
	FaSNo72DPTuGv12tOElNSPP9Lq3+YYnSVJUlgySZpp/nl4cnYAlL2KNI59miTWwjMQugLGv9XEr
	sqe3PUQBC4uJdI9dfpVlSjjxCmBEN4riEz5h8DWFj1fkuAqgtfWhEvA2WTyhdFNIBzXfLUgw9pA
	+3HCfN2w9FTcN95EzpU6samO4NYm+DeZvUaRdeepurW6Mn6LzF4opQFxSCA6O7GnxWr4xktfnS9
	XBNFa6dqx33vDBbWnLfi8Hyw6k1n3DxwadPk92GtvRfQPfwTk5zIvjOJT+zN0BC1jtGQ/dp1D9p
	TE+Z5fJDNQ2q45QfpVH30HMcw3TQGmAoVUurRIHX8WHWXvrgxUt44ZpGwLG0C6+54ICe8peb0sU
	lT/I6nZ0oSTgCUc/gxvHKd6Jfk/auS+l7delChOdG
X-Received: by 2002:a05:7022:e2a:b0:163:a197:722d with SMTP id a92af1059eb24-1b543b193camr3049076c88.4.1794994732386;
        Wed, 18 Nov 2026 01:38:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6365704eec.22.2026.11.18.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:38:51 -0800 (PST)
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
Subject: [PATCH v2 1/2] ASoC: SOF: control: Report the volume range as ASoC does
Date: Wed, 18 Nov 2026 18:38:39 +0900
Message-ID: <20261118093840.3514408-2-sammiee5311@gmail.com>
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

SOF controls with more than two channels use snd_sof_volume_info()
instead of snd_soc_info_volsw(). The snd_sof_volume_info() reports
platform_max - min as the maximum, while snd_soc_info_volsw() reports
max - min, limited by platform_max. With min 10, max 100 and
platform_max 80, a control reports 70 with more than two channels and
80 with up to two.

To fix this, compute the maximum the way snd_soc_info_volsw() does. The
helper is reused by the next patch to check the values written to the
controls. It also no longer stores max in platform_max as a side
effect.

No SOF topology sets min or platform_max today, so the reported ranges
do not change.

Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/sof/control.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 74d997a4f620..136e2ce15201 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -15,6 +15,17 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+/* the maximum value as snd_soc_info_volsw() reports it */
+static int sof_mixer_max(const struct soc_mixer_control *sm)
+{
+	int max = sm->max - sm->min;
+
+	if (sm->platform_max && sm->platform_max < max)
+		max = sm->platform_max;
+
+	return max;
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -50,20 +61,16 @@ int snd_sof_volume_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info
 	struct soc_mixer_control *sm = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	unsigned int channels = scontrol->num_channels;
-	int platform_max;
-
-	if (!sm->platform_max)
-		sm->platform_max = sm->max;
-	platform_max = sm->platform_max;
+	int max = sof_mixer_max(sm);
 
-	if (platform_max == 1 && !strstr(kcontrol->id.name, " Volume"))
+	if (max == 1 && !strstr(kcontrol->id.name, " Volume"))
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 
 	uinfo->count = channels;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = platform_max - sm->min;
+	uinfo->value.integer.max = max;
 	return 0;
 }
 
-- 
2.43.0

