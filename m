Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913222;
	b=qFo1jJErF33bi5KxjHcY9LE7Y3PTksz8wt4gR8Bkk3qND8SoAbS8PzX12QmsIdL8xFd6
	 VPy4YrnhbGjs+5PKkdS8qBkQ55AwW5OhzaxVplkq8Wk161mLPMs34lOtG2XIbUh6IBOh2
	 ZFn72DURK15tDb64zbx+hW7tfheR1HTaB+y3Vmz4cCXu7xQSUDgWyO8unH679/Srtqzys
	 rpiVs3UTtEWJGYOeFH8gFm01T0NMRU1HOwHJ2hJRXmTFOjCemViFyo+E8e/Ok09JKFpdb
	 S95eVLAjWlMwubjXwYjLzIguZClyDtlCUpA3FNX9UV6ciP579ZPWllSFZYlqVF8qleA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
	b=pRQgST3npPXxEXDq1Ztf7ImzFlLq1fOuIdHDfhbeVpyefTArQxQdpl8Y+Z/zoa4wXQRf
	 Ns9LD7RluwXh/3H0RI3joR4G5T0joIo5CUr61V+L5QDvb4A+rwsoOjrmcT3Z2k/rG2O1V
	 10JTkwnVv+DMd4uZgSj1SCOomJDSqwh0DOny0S9GaoRa3sPQEXf2OmJQN9eYxQU5YXKrU
	 xr+5eX7GYXDUMhMwvDu/p8LNLhTbzXW58ELYzLr0jdXAwTRz/AS+Jeig0ZZ+8OSS/Ojw/
	 WYtXDmeaujsO85hgisXqyjF6kSTAVktP7bBMTrB/ZrLdOE8P+TVwIs8f3negkA7G+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnQquNwQ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C07606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnQquNwQ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so3746743eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913221; x=1795518021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
        b=LnQquNwQRSrszM9UfREe7y/EgWHi4GxN+ujrSQonyJChpCmxsl40Ukg2UoSRKBGdLb
         sbUIYgJ08upGimPmwRM0kSz8/jf6RSlnTDaj0zSTllAujWYB2dQIKJ7Dei4Bflp6pAek
         w37/tHZOhwn0Trzb9lDxF1WRMN3DEQvDBh9HnUxL5U/mdtGC4yQ1PotuGhfpa3TbWWKY
         mP8Mkvorm6YYiO+6melfRUAAI17YKr1jEEllwh0oqq1G/Y2+p0R/Vm+b7p3yPg6ra2Ic
         TxKKFvOTihVGkbeKsz+uduXUkUa5mD98TltMMjBi7DJQp1G3yfBJYrYWiS1emNQIHIm3
         NgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913221; x=1795518021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvlPOEVV1AcUDTBGIxVs7H6H2hWVAiT7KDKCZ1nVAjE=;
        b=p/VADAsSAwFfGdvOt23GtYArQd8i+9a8gGVu3UZlPoEgRBjEgye8ULB3bqLCzea6e3
         zm03mvyVoKIC+OBFV+803mNB4hKqKXUh9cM8l33/GsR9uOVuUcSihNZ8w+/v7hBaW18j
         06fFmbzSeN9cI23DsaT2ioFbFCMSBZygC1o4tx7XFUyboFfhG3Hsp7uEKzMhGctbL79q
         quyV14qkVS0yvWJtXw8sYvjYXj9F3QzMtN0ZH4eUmkYuFmJwcjoa4T2fyj6NYHaTPgFn
         pkq5eYBnY3DiNbX8eOGkxZNQ3UhAmyy2oSOAxX+/o6MWAqLR/9+pGeXAdpUz+/xf4J5X
         I9OA==
X-Forwarded-Encrypted: i=1; AL+hErFG/zQswBMyvr2R3MYtoGbdgk1YIeyRv/ydGVOVkUs5vznZ6wd4+7jwUBl7kopjC5Txhs0H57tIQx25ew==@vger.kernel.org
X-Gm-Message-State: APuU4Z86JRjy44RYhNsYydY/Pza5z3spNs3A2tj2vR6vSNEtqYRaW1yg
	6EM9Nuw5nfCi3ULaZP5pe4tcN2j1Nqjc9ZmxMVM0nSzKi4zGX5wvGQRA
X-Gm-Gg: AZFdTZdHU8r0TrO9VZAl24AJTNNzt1MQakNdIUzopREsCBgyUasT7NQ2WLsih6ruj+9
	AeUmpu9VJvhLXkgr7u3kooDdtuKBbktBvVEEbbzhpbStVgyYnsOLirPPtVii9TT/wLRllhmx++K
	agnZtQ5b9i++MeHiBiQunno9C2J6LhOBwF6q+JDcpq/9pZb7AVdyfoMgk5tRyhBeIJOfep+SXFd
	UmLUb09Sj+A4p65mhKLPP/Xi3YkIwN8RomsMLxlnwe3fHx+G+Ik4IU8uA4rq2vMd76nXtOikfQW
	v3KfwUGG9ngrBmYhc76qlaLE1m2qgprPVIOPyw2ZshwPDlQXFuG+jrN/33SiTtHAYfu7ltVCVDW
	EpHJdmVDuNLkq9+GmIyq47WnvBioN1W2HosjyPbMp+PvkJwqMVQEBSizQFh9ct3B0Q0kJ46glbA
	NlnucVPR007yCdKFU6ISWUQrGxEzmuQRMVW3pmolZ6sfla8Fzjyl6m3RYt2CEsicy535nxCCkSZ
	N7MItAICA6xj1E42d9btypO85agfzp3oLLdDaquLhqvqBSQzh0y7+jaESXmScDWSUFB6t/k41h9
	C9kuvKeHYXjFMrtY4P6LQs70JHkSwYABYm4xaBfiT1NFUnAeV5CKOingvlO4NR6pcMAu1ljx/zj
	fmIBdb3FdxOPDZWSx+Mo561olDCv4IQ5pdqiiCciIcpYsV+faeD3Lel8wt1KNQvj94RtZg9aVt/
	u+XcI7+gSYQVE7BIhL4TOajqdYH96EI7pr85HcaQc0og==
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr14258244eec.21.1794913221017;
        Tue, 17 Nov 2026 03:00:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:20 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: SOF: report volume changes in mixer steps
Date: Tue, 17 Nov 2026 16:29:49 +0530
Message-ID: <20261117105953.188645-4-kapoorarnav43@gmail.com>
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

The IPC3 and IPC4 volume_put() ops decide whether the control changed by
comparing the new linear gain from the volume table with the stored one.
The stored gain does not always come from the table: topology loading
initialises it to 0 dB (VOL_ZERO_DB or SOF_IPC4_VOL_ZERO_DB), and
volume_get() reports that as the first table entry at or above it, which
is usually not exactly 0 dB. Writing back the value that was just read
then changes the stored gain, so put() returns true and user space gets
a change notification although the control value is the same.

On a Tiger Lake laptop with sof-hda-generic-2ch.tplg (IPC3), the ALSA
mixer-test selftest reports this as event_spurious failures for every
PGA playback volume and for "Dmic0 Capture Volume".

Compare in mixer steps instead, using the same ipc_to_mixer() conversion
as volume_get(), so put() returns true only when the value user space
sees changes.

Fixes: 95a32c98055f ("ASoC: SOF: control: return true when kcontrol values change")
Fixes: 955e84fc0b6d ("ASoC: SOF: ipc4-topology: Add control IO ops")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/ipc3-control.c | 4 +++-
 sound/soc/sof/ipc4-control.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index b1d00a2a860a..b8f4d963e07d 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -180,10 +180,12 @@ static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
+		u32 old = ipc_to_mixer(cdata->chanv[i].value,
+				       scontrol->volume_table, scontrol->max + 1);
 		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
 					 scontrol->volume_table, scontrol->max + 1);
 
-		change = change || (value != cdata->chanv[i].value);
+		change = change || (ucontrol->value.integer.value[i] != old);
 		cdata->chanv[i].channel = i;
 		cdata->chanv[i].value = value;
 	}
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index e29c8d89284a..8bf300373d22 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -153,10 +153,12 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
+		u32 old = ipc_to_mixer(cdata->chanv[i].value,
+				       scontrol->volume_table, scontrol->max + 1);
 		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
 					 scontrol->volume_table, scontrol->max + 1);
 
-		change = change || (value != cdata->chanv[i].value);
+		change = change || (ucontrol->value.integer.value[i] != old);
 		cdata->chanv[i].channel = i;
 		cdata->chanv[i].value = value;
 	}
-- 
2.53.0


