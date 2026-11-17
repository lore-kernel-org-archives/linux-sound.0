Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913216;
	b=mjWeJZyZb+77ovsl8KxDyNvCOEuLVndW6I+Lh+U0ANx3B9teF5BZ6PBAVwykr0XGBQzr
	 anNC3eac6a1pgkimcIUezmZYIt1PhQvdVwkk+B9vOkv3CwY5KEQSAeLuvn0IADKl9R/W4
	 5dPFCqghP41TLn2jGJPsd/gpRG3AAjFxBzzTtZJinKpq6wCQVimNpD91nfsrUeCwBEZc5
	 kZy7uUkaa9F5SklzAZdG0ftYAz8Rx5RRhTAbtZqPollCQH/sCHR9bJqu9mf6/dA4Ys7dZ
	 ld9/iqYcPKxFcR6INwpD8SYsGt9XjqAj22xvDK/J8sQIR9akGUEwLeuaZ5agzuagxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
	b=j/3u2MoemnqX8vLz90AWn+9wgfqZZM9ejvfwXoNo7XsZJybN3gzZGOluTweOU/naCnSz
	 dKUxyVg8tghpO3NYa548lZr9Pen1WMgTcUd9AXBPZo5BOI16rsxwEw6mRvRoV8PvOH8nj
	 bPLV85cJq9GOpSumA9/pkaIDJwELytlU0x/ycwulfVGEiExfoCTa1ZN/9vDIutwmp1r0+
	 zn+RYKjBYk+AUOPutgwfS6CWsnEXbSBO7VPidoDb2cgSMcr5VrUhEc4RxdLJEXa1x6c/j
	 XJKGfbPKwr/8nLaRORF4nIZupjRQ4yNaPyktstJH47rXscSgt74I1UgmlVpniidYeHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcmHFry;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568D606A329
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C568D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcmHFry
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so5318422c88.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913215; x=1795518015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
        b=zTcmHFryyJqmQEzU8roMILxbgKHZpgOjvYoi7XLgRdOZq6MNcp/qJA0gzxUqUTjbao
         d5DtF41i8qvsELX8dyzpuWUBS7+9DQknJ+i360vOXiLaVHgt0ZDs47UAW1TiYHHx/ei/
         IQdg4vQiosdMDDjlJ2TlzIo8UFzHNnCkc/nnze14jkGeGZzyujXMMW1l4ksnxE++VWIa
         W5cbievGqq8tfGGORDtFQRuaOf34JUh/8i8zOk5ZOBt+tt8BjQNO7xWNnRcU8ECQi5Fb
         qhyCKaMQZaOGcou7J9JN0ertGs5JATTylLmYQUTKew4R3yUk/+DUFKQjXKVKYe0GtEtO
         jCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913215; x=1795518015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kcutvjUdZ4ov3hkmBXM2akkkEkputZkpYqnDUcIAoU=;
        b=deC+kI9gldzOUSnIRX0/dAJcbwaIBuOT1lxMUsnQsMF4bspLymzU6CXVDPgJy2OiV/
         DLM3R/OEeDc3y5gFI/Znx2MGM1KlFzXvr+6IGXsN/CgF0EzT64970cWsFx5Bl+dGzxFd
         EbOBFP9dFXUUrFA1cqaA3BtdzRZ45xiPl85KtDiefzMsOl9EsgQZmUJ5X4RmfF4szBJ2
         r+z1bhJtl12JpKKZzDKw4d1TPMto9Dp2Y9mZ4YxfODsixW2QdF2YusjbTKDcjWUYZkqJ
         ZLgfEpkaRNTFkbViuy7EYs16Imga3imX+uCn+gEzDN+kVZATY1rTghk2V82s3ukpd1j6
         VFRA==
X-Forwarded-Encrypted: i=1; AL+hErHDBnlfdeJ/SmnhbCXB1kbAFtFpF3QrW9taXVYNUWj5htwqk5SAA+M1prjdqXegJfkkBSAdGbcCntEkyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/am50rVHAFRni4fKKJslM0forFxH3BZvqpx4urPBHmCHW2YjiG
	s+X+Pk0ZGEpJFfL/1JiKN5U2/YxOWBGjKleVczIPohzwuOGfNLf56VUG
X-Gm-Gg: AYBFou0n7eNGZ+3pdP3mRvkICh7kNWqDIEVymTmCdHuSpjjcz77MDEiZ6bQevE0tJP9
	re07RPxiZd83mr3Cx+bF4LGxpOKfQEAcZgSPwJ+SJ0Hr9X2SfMM4/U2j/ENzUOPrfzID21F26KG
	50b2DfFBMgQDk8kDpZcRjE2zYS+DpY321p9zd0RgR9/tHF+wMXq4gaLxzoTEyqAAIrLcKVBVTEx
	4tzyDn82sHTgvdkQARBuZCSWmw+JsexTTYIN5h2go3m62u0pody420YBmDvGcZxEOKaXz/9vhKR
	5QMiEpkw8iROR8m70KsJZMPBi472UMjKVRXfK5KvwjvnNtUSg0ojR3rvf9gvmnksWPRlxL/3tDl
	0ez1XS+v2ueAVbuHNU3c2vDZbgAAQfFySZ6kmESkeDwmA4PcDDOio3pkjD4ECDTwA5tGE3M8Gb7
	kULIjXL4zKKsTqA2S22gTg1lMQ5YQHC76MMB5IUKRfzLH/r2fKIab4hpONrVyPIKzr4zS2kTHFa
	Q+0pbfa87c0PtW+f1xOQm2Q4lASXDWLJEWVuVoslXyYcsYGXgjQYyBbNyKG6sPGCCtSmoPJYx9o
	AzaIYDMYCle3HvSdROX4SEIwEnbhg84AVbN/t+OdFea5McCgizMzYZYVX9SAhoq78kTTLzAaxFA
	p7nqoTUh7Q/+ufM7+vADrEZXDj5OVRiJv5l/i5kJa3+2eGSCWYlBuEkV8+C7NWroIZdt/Zjl9ys
	WHfWfDe/DpntRdP+cI0RuyiSEej16DsKKiCgvlpWBphA==
X-Received: by 2002:a05:701b:4585:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1b503131a8amr12904033c88.22.1794913214639;
        Tue, 17 Nov 2026 03:00:14 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:14 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: SOF: control: reject invalid switch values
Date: Tue, 17 Nov 2026 16:29:48 +0530
Message-ID: <20261117105953.188645-3-kapoorarnav43@gmail.com>
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

snd_sof_switch_put() passes the values from user space to the IPC
switch_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. Writing 2 to a switch such as
"Dmic0 Capture Switch" succeeds and reads back 2, and writing -1 reads
back 4294967295, neither of which is a valid boolean value. The ALSA
mixer-test selftest reports this as a write_invalid failure.

Reject values other than 0 and 1, using the same range check as the
volume controls.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 02cf59bf1f95..a36c4c1d4505 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -109,6 +109,9 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
+	if (!snd_sof_values_in_range(scontrol, ucontrol))
+		return -EINVAL;
+
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
 
-- 
2.53.0

