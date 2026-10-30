Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374930;
	b=gQhjNrXbq+bIECQ/kptRYfkD7ApKCo4pxAuBU8d3Sdz3Z94N8xdUFX8WV3BB+NEXkR0H
	 /NIdwhDVgyAsUWCpT29xs6p3o3l6W2OYSrhnaARXcqicDZaY5rZPfL1HE/scLNhimA/ix
	 UJUQHpwkWljb0Asxdr7nQ1AeesWUXd29eoBOef2RPtRlqBt7e9WMbvvJZOcUxiKeHhHfY
	 wrC9BV5iKMg7cVet4uY7VjWYOmKG97hjUAg7g6YbDZ34W9tD3EkfdmQF0ldzfcPz4RXtZ
	 Qx/9fEcUNZLBoEIV3BWDeR3/XyL7+nAJLC86NDIpaF/eZCeja/8EI5y+YaDrR0g0XJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2chJiSmeM/KHh0ZbqVdM0zVWtYPHgi3wnKH/o05KMYU=;
	b=QJLH2I0lHDCfC6ICn8Sf4zy0Tg1u0p4Pl8BXkWkrcAdNmHD/7Iq5f/2mw7nmCTFjh7Bj
	 W9lu8/+QRX+EQcgi+zMle25sxovs9ATJcgafPv4eelujGA25pfKwZzQCUVlR08st3xIrJ
	 h5UgsBBk0SAUKUl3aacPRy6rsXIU2fd+u+7u+czULjlLneHQhbskfM/GFkjV7b5ywQW7o
	 5VEV8iP2e+N0xhKQLCpbmwvrllwyjh7ZL9Lxtl/DRiMj+6xNDxtnnDOxwqMi8uP1x1TY6
	 NDQ/zY+JRsd/uSNVKX2N7ISJAmeto9uKXlgWqGu9x100IOLJ5QdNW6RMKgQmP6QAwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QCNiLo/b";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FB606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCNiLo/b
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so7419445e9.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374929; x=1793979729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2chJiSmeM/KHh0ZbqVdM0zVWtYPHgi3wnKH/o05KMYU=;
        b=QCNiLo/b9Ovh4wyt4IeJSLMrw/6R57uC95QRYqdDCPGzdog+dsas4/Hqr8CtQalpWH
         FRo2ZblFfijeN0G7REGTrKlgCvOvpkd/zVSePu/G4qC4knLNCVlnQzvjh88SDpgWLkRK
         lZZCAdp3WsrptS0kt+f5Sn/sb5noMuJ6OBWDtz2pa15rGhnVkLruyDIdb9RDpAzGCLIW
         HytaufkZurmQjt2+WpV6zLUxEWwvAEjmNj+6TgDTIqn1jyLSiraZXOAWHJRcDN6rM3Ve
         a25ke2ROHnZgj2qeg2Sxd8K85JNI28UTQCIqjUXZn3XTNMSmcmrRWSfti8H5nq2Z8rvK
         4WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374929; x=1793979729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2chJiSmeM/KHh0ZbqVdM0zVWtYPHgi3wnKH/o05KMYU=;
        b=GuVFyVugeEvCvekN2w/mNMFEaJB4vFokJBvOYDFg38n1y8kuLHL6JmJCZ87SVJPhWT
         99F5FYn04MdyzRrxOykmDSs/90Bu37nx9f3GucZarwt8ersnJl4EM4kUm+m8c3goOPp5
         fsW4E97/h1G4Ljew+BjJ+qyknhKNr1lGzT3hvICdL7lEWzLcs17MYGeZIByrAgxajTf8
         7xNqF5C2q9gvCsC/jF1EDwHRet/DOyreMCnyfvBwrSdOHDSafmnfw3jBOAWDlRnozFuX
         wSJCSKCdQlMxLpNYHRMuYeGg1o9Eut33pM0Xxx6hHBsrgoy6Sd6OQiq8RVhGj2WhI6uu
         Wt8g==
X-Forwarded-Encrypted: i=1; AKwUvByMPlKy3UNA2lWBZmEe61vSy1BU1CVjRyPabS1iNfnMDobyo2kEZmQrwDaeZbyKcNnsH/bP4zO07M1gkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJl0i+N8yhi4/c8EFxT1D31bq6uEPU8GayTqDGYY7rsMYf3J6x+
	Un9JhxtSOWR6ptFLMq9maDc+zZh8Svg+jzp22tuKoPccHAdBTNIY2kM=
X-Gm-Gg: AYBFou3NgWM73OQn8eb0IvTO7ZvGnmSufP1m6Erh9BjWYFmT7JJqTj9VjgPXSYr++8z
	FxhM/mu1PbfgusZN3sReZ4jKF862Wq5jBwA9pMb8vrpKraw/ZMSC9B9jwqw/v2Wh0FsorkcUU/o
	sHEGEZGR+ZelOm2bFcBZ8Pb4kLArD1O7paTOvk92Gpsz4ixzZLPFW5EOwHZPyt8kSfSuvQ5HEWY
	qc48Ax+sLR1X5iAUPobmTDqm+cnhJzTN/6kb1pxZpJTB6O138+FVDLgvQfKaPlr4WEdSAd1BYpm
	0rAOuStnzI9kUpO4h74abcJ7dt4jpmUjPr8+UrXaNsj2Yb12gfk4u/T9XC01uTM7QOj6vzv7COE
	9wAPp1ttKGG2dwKDC3PyObk5CipZoep0cg7nX700WFVw5ZcH/2UzqnnoIdznVZG6FjWlTAl3aYY
	sI4ihqWgKN32zNgfL+HqAC8hhUogf8DifAjEGCU0dsyiqR3Hz6hTiwq/hKDaxFx6ByTzdaUreLh
	OMf4MjS1my+06i4wUZROFxtd/Q8XGDachjdgtkBZsqVXhn/cBNMe78PIqxXDZfz/ebRYVWryrPn
	oSY4mATUoA4=
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ac1709aa77mr55928965e9.16.1793374928702;
        Fri, 30 Oct 2026 08:42:08 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm144419935e9.3.2026.10.30.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:42:08 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Date: Fri, 30 Oct 2026 15:42:02 +0000
Message-ID: <20261030154202.2989936-5-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030154202.2989936-1-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
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

wm8994_component_probe() schedules several delayed works to handle jack
detection and microphone status polling.  If the component is removed or
probe fails after these works are scheduled, they can execute after
resources are freed.

Cancel all pending delayed works in the error and removal paths.  Guard
cancel_delayed_work_sync(&wm8994->mic_work) with a type check because
INIT_DELAYED_WORK for mic_work only runs in the WM8994 and WM1811 code
paths.

Cancel mic_work before and after jackdet_bootstrap because the two can
re-arm each other: wm1811_mic_work() can re-arm jackdet_bootstrap
through the DAPM power-up chain (force-enabling MICBIAS2 triggers
clk_sys_event which queues jackdet_bootstrap), and
wm1811_jackdet_bootstrap() detects a jack and ultimately queues
mic_work.  The second mic_work cancel catches any re-arm from a
jackdet_bootstrap handler that was in flight during the first cancel.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
  - No code change from v2

Changes in v2:
  - Resend as part of unified series
  - Cancel mic_work before and after jackdet_bootstrap for cyclic re-arm
 sound/soc/codecs/wm8994.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..b9e0df83b9bfe 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4551,6 +4551,13 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
 	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 
 	return ret;
 }
@@ -4592,6 +4599,13 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	if (control->type == WM8994 || control->type == WM1811)
+		cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3

