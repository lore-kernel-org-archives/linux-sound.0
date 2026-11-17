Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913229;
	b=K+2F6kqArIljSlUp4EMTl0waSlsavxvleCIxlEXLf1ta0ocnL/ncN5e+R9aELaYr2rvW
	 dfmS1D7h+RhHY6X1z1WSV4FYQsruvjZibpZ8QdADtlnk/asmjMy8tUVTRChuQC3J7v5NP
	 S++5eRjnfm/aJmBf5NW9bJAMkOVoCoJTOZTU9ZTi4oRn31LdqJSO/coWtnu2fxuwmxI2V
	 hEIOkrYmXW2voUFAQMfWbBEP4jDExs+Of+tT4UCikTD02sQcL8ol0KkRElBDPNqtXQKxV
	 BRueAk86DR4qyHijyPrSUWxRWaOf1Z2B3y7nuGYHtt8j8DAwLlcKgw7p1ulvVVmOw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
	b=z7//Sq/nJ00HaSLSQ83gyE63ACgMOF/iev0ODWhJCg/XhHhyvMCEdGzfSLHdN2TSxsYw
	 ZqwyQYm9st4x4LaMkT5nc+byNajSIsuN/HgAYHJC9k5RjqUBBg8gqv6TtQF/jzmudsP2J
	 iJ/g629ordGAii6mP3PFe9VxAXEDlDgjy2o6Sqx65FAWBK8NYR/rnEI959mAG4btnZ5bT
	 PDk8VkLNyf17X99B4ja/IT9IXuOu26lr4IjZ4ccrhoXLfPJ4O8OraBcI661YjJVuoflLw
	 wRtkzhlRtkTLfzIvSybmcwKH55kfl7Fj4l5JtSmwk4dv35bXSY1hIhTfj1N+RED/yvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+IHAM49;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E878606A32F
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E878606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+IHAM49
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5867135eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913228; x=1795518028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
        b=t+IHAM49VlNygVAwQr1F/+c1XcncOZtHiwQsU3pDmXhHVM97Bgx9N1US98/CSmXpN8
         GH6SuIxGIblKSBzCVLmtN8b6gQPOX/gtZzZWnbdf0hwyN/QzRTyqgW6rRgceLKq/1px+
         01uUpEA1/+5tdIXKZImcvvI7YExb+BD4VyS1A7YNVYT05JmRyLkt/eHPQCYrcuVHaZ8t
         0HQgGAxs9Tu0o67cmBz6goURjqfJvy1SfBQb9V0amjgbiOJSWPo9IODbMwjhwj+SCeBB
         zx7uXe35zpdWCWkPBcANnM9N0FLyUegGvDy8m8KW0EWQng9N/5EnvrgHsw+yenygQzJa
         +KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913228; x=1795518028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
        b=LqyKqQdm8kIZR1P8gccPvmEmce0QD0ocyyF4xj2tJy+7S1obnaoSfTBP+vfy/OefhJ
         LQexX0qYNZEpPpjLzGJvGJCwxIWf9RR681fjNx2twdVnoA98+0T/wsSR6vI9uCeNPeSj
         mj/Pr4IlJ/lWqzd4AhRe/DAya9HOIGkyIwfEXmPvcpFvoKXHNLrPtBHhW+WlRyBDDOom
         oi5EDR5yD4dSlKzc+tq0hTYN4f8GyVZihSiZI68Y3zdEZsWBcNREA0qERUPRlkxD2Uf3
         9htu7iPBXlK8WM6HYGCnD66z21qXJ1bBlPwfMEQVmTWLfWM4a9JFf8Rv+wq9Mw4F0Tn8
         rm9Q==
X-Forwarded-Encrypted: i=1; AL+hErFq2a0Pq6Hwa+gJnIew+TOeA6Fvk1gTdIXlEmpi0ZmHKO4MkMcdwXwsW1ieRkii4qo7KkFZfxzyj78Ofg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GkilfZjk7MCOQq5GhpbazTbrWxwRqF8wTads+JSUBdlV49H88
	5ApFxNenA9wFNit5ZN1QFf/FtA11UySLe9qpwCBYhxhr/D9xJ/hvL/cO
X-Gm-Gg: AZFdTZcAVNTHwvoyTvaXKhauC8BenyToz8GU/pQAjlHw56L9mmkIrisvF199iy3/tx2
	7kbT6rD+x4HzNm61fTS+gM9At0/PL2GGXvC6qVbPYA79MEeausjdGmjPbdy+sz0iS+XqQZfc1QF
	nkdaUpXsrS2jXs3B0PZV4ajb9RQWOmtVz/AnYbi95+E1vxsDDEkvzH5GQTs4yAFTUoMri/GNztc
	aSZclaKXAwopM8fUX+oP85/fmt/WZqp/1svSrncZkHTCtttH/fP7OxcFAK25PdxQf90FmyYvgpF
	AbhSd6ysIqzCQ4FmGB8CQuXwACFt0MUXUmkZIzNM2KMD4zNjCnqmRofxQNy8HHy12f1ES7+Q0Iq
	viwUjTFyCpgetOuhd4JgDwvlqvbfNzUFp9FFqewxXe57nQgOBMVWUrRGSqQBE2DoWKHiSlgccag
	rGnpeL4bT0OUVr0PxdlDwH5Q8Dk+ziXb/oEzFbS/VK6c3u8OV1TTbhgZRUV+yRhqp8owKjOJeoK
	7AeBWmIiZVkdTOE0/Wz9NvYsjSBMq4jgoQudy/hP0nWf0NW9rawejFNo7QP1Ld0pRPKB/wUhjTk
	BrG0vyHk4KBdo+RSY6/qmUz1B/8dIj5ZHGLwihOBHX3meefilUCCskjDBq3PSaWMoPUTmJspGdg
	q9B6zDYFLjA2GKlYm4ryaJbp1Owv4w3QejMNoATh3osNU6DP2Zwct4/aQoxJWFnIW5Vlm3+2bbH
	oKvP2CC8AHg5XqZusXm9hAQrBaGhsvrFEefZs16LTzsSJsoS6mjiGL+GuZgFzz5Rs=
X-Received: by 2002:a05:7301:1524:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-3814b4bfb20mr2043792eec.34.1794913226828;
        Tue, 17 Nov 2026 03:00:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:26 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: SOF: control: reject out-of-range enum values
Date: Tue, 17 Nov 2026 16:29:50 +0530
Message-ID: <20261117105953.188645-5-kapoorarnav43@gmail.com>
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

snd_sof_enum_put() passes the item indexes from user space to the IPC
enum_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. With the IPC4 sof-hda-generic-2ch.tplg on
a Tiger Lake laptop, "Dmic0 Capture TDFB angle set enum" has 13 items
but accepts 13 and 0xffffffff, and reads them back. The ALSA mixer-test
selftest reports this as a write_invalid failure.

Reject indexes past the last item, as snd_soc_put_enum_double() does.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a36c4c1d4505..aa02376d61e6 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -141,6 +141,11 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++)
+		if (ucontrol->value.enumerated.item[i] >= se->items)
+			return -EINVAL;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_put)
 		return tplg_ops->control->enum_put(scontrol, ucontrol);
-- 
2.53.0

