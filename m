Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621067;
	b=tgPYlJCTYdZg1LGJplN2yiTnZaUCcehYHQF0MMtZOmT6bCZz+UCQ5XtvP727k8ICGhTm
	 2bgltcnsY1oUhfyZbjm9+OZ9QxdlR07vuReWCjeWBXKccT95/potLAm624Rosi95af1S4
	 Ipy7R/umpnDWd1RS6+o7Y5Eher9YWYnxxx70OfPHdGLLOaAPEoOJEochq/vuyVMtdWOI3
	 +2/Gb58JsLb8LfkuHjkxSlSgbWpwJUZX1IPaKuCnEiFtEeYqQnPIXJIGON5TXse+4pUh/
	 +enUMiHrnFTiXmImVaUytalKqRW/APl67F9tsQWjyPl5+RwARs65UE3+EE+Xel+xI1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Sender:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 From:To:Subject:Cc:Date:In-Reply-To:References;
	bh=88Dl4t5L6yCj3fxEn5euT9WgmB3orlJaSIq1frk/2Ek=;
	b=bJV2F4aAguPqLLzbntrOMZT6Ca8BS91iMi155vIULyq2m79A7YEN7hIOvGckeBEPrLx4
	 uZa2Rwwe8ueUz0AIXKbjp/OkJFEmhnqz30adHge8r3KIlU+ZNG3BiDN+KaMBICIvw0LMK
	 DO527tUUsFLhOxFCXfWu7+KFcmvajz90G8zEPpRKd6yC7et0bDZE7NLRrOW4JJwEN+jZH
	 e89AwaXKbFU07HEbfcD5Fez4lK3GYnxlPseEy/p52Q4Nd9RDvCPTEzScbrN2bddB1Z3Wd
	 kykjuI4ZnJmmJlfFQhAgbmn9UHI+PRzqKHDdGvR+d8zaGsAMQ0YIbLUVIaY6/40j1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kF/zcEji";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2303606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 12:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2303606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kF/zcEji
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3061362f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 04:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621065; x=1794225865; darn=vger.kernel.org;
        h=references:in-reply-to:date:cc:subject:to:from
         :content-transfer-encoding:mime-version:content-type:sender
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88Dl4t5L6yCj3fxEn5euT9WgmB3orlJaSIq1frk/2Ek=;
        b=kF/zcEjiXU0bl6M+mG5q3Guxol9SiRnCzjKGlPF5/EMhrEKtCpGYJy3DDLwqP6U0D4
         M0JTm9LBC+8O91qSbYzYkwIRhdiI5U+dJ2WzUo/oCWRoB4DEVYFvuVHuTojtV1+6WYCa
         5cLSbCASfhse4FF/wuBuW502RmBfY1VY05aDMLV2F5T4Dt+UUWLBpIECGb/yUiXZV7E9
         y0eA+ZoBSuP4SzQhTksf4qHfi+9Bw058vXliyOGoebupWrHwxFW3w37cNwk0hksLOHzH
         gjMaP6Dc8PcEJ9Y3dJkcm1HBt6fy6YF7zPvpggAw93vF7k/uxJUYMFmeQ68MV5HHWPVN
         uXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621065; x=1794225865;
        h=references:in-reply-to:date:cc:subject:to:from
         :content-transfer-encoding:mime-version:content-type:sender
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88Dl4t5L6yCj3fxEn5euT9WgmB3orlJaSIq1frk/2Ek=;
        b=0z5t8XtYc/K2gA4+NXNom45V4nPfh8aEhIfxNoJKDef0E7vllobAcxP6tQp2GzATvt
         bn7cQTUxdPoNdTQ8T75/8bbr6zWoDXPGYeYUcIUFw1uFAwFVTCsJtAnpOlxmKYyGLF3z
         rzeJFCYGFoKqbCailAyjwiwHHIoWHRAZiP/UCdRY9hkcr4Nj7P8RrXONFeaViMeBDpnf
         nUMy0wKy8TOt45n/Izo6tmjiuRiawW5IH/3qvh/o3T7uUKCNKPHuotSugDAvTW3NBgTg
         yL/yhxFvqxp0wGamfLEH6Ld664BOHjDQ4JJyjfQmHWobsJtzTrFmIKGyO1Wze6zHQknI
         83sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxshvAxb4w/kPMQXhxIqtbi5mQbls5N3IMn2Z9wkGZEPoxDtsKoRwOy4ID/dHSCAecQvcds/vbEbdSqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z86GjuAj0l8v9WOkkrJy1hovaBusmeeHd+F2CWa9GZRqQ6eYOR1
	CZuAr9P+XunFGQ83BCQzeUj72Vfm1pGFJQ8Jr9Qt3Tomu4YSgo7G6yKV
X-Gm-Gg: AYBFou3Od7zC2Z9uP9txllNg+2+t3kr5HmqVnn9UbTakGoN0q0uQ/XUd04yCtq/tpd1
	EfN/d1LueTM5qvZZPs3LoMF7glU32SahffZ4dviCVQaOwj/LkLMXDLq5aP7TPECxpDqG3+ONhKM
	hZ8seCuDdBOwnf6gxzYAjzmDYOM+X83B0Rx+2dRAyT/3P1Q3rfWcTAnHfFTixQUU6oNFClQKbEv
	lzX30H47IVxdJf7Su1lJGvjxNW/P3SNHKIEdUqICO3WcLdbMjnjTw+GLazjJ0X7CTJSUNhmkglq
	CJTAEWRNEDnQoisYR43O//5kwDNQ5CJKm5PmgylQspyzrWncMACuHPfWZahWx6QK/RFQU6V7Sko
	PXG5Oxn0YlDjrFrnBC2TzlTUaUqhILtYqwDs7ewCOauDvvTJaadbKusRyHA9AxyQJYS3d0aCV6s
	JsmqDAJGfb1k9mjyMbS9s6bASIgYjhb4+FIXmKgNtR24/PjSI6pdoK/0OUNSY5gVBzYv3QVc3ig
	tR9xZhs8ZAOtrUB5FfwdzF/t/C40LajlplQkpfPm9YA3LW+LGOCd72pqGqE1saFp8oxJk/0nLN3
	THWq1AVosklr+3nBkjEiA0Is9j4kMFQqaWiz6ettnZSgt0uQfS0ym5Sd+qvI15E25kPVTQfviXu
	SxYIfk5bpnOK2XAYGzd9s67bATgTnJHtVVqGBIu1zaNxbJ93LtQd31uOxJ0fjyq9hWTMKFicr6h
	tyYJxxUy5/8HiGdphLZNHwmfgnfQeR9dkOLx1MSD2grhzV4bM=
X-Received: by 2002:a05:6000:2387:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-48e6e50b79cmr22620613f8f.48.1793621064763;
        Mon, 02 Nov 2026 04:04:24 -0800 (PST)
Received: from [127.0.1.1] (88-170-213-78.subs.proxad.net. [88.170.213.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm20184761f8f.1.2026.11.02.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:04:24 -0800 (PST)
Message-ID: <6ae87c48.eabad26b.28ae48.d5ab@mx.google.com>
Sender: Tristan Madani <tristan.madani@gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Tristan Madani <tristmd@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 4/4] ASoC: wm8994: drain delayed works on remove and probe error
Cc: Mark Brown <broonie@kernel.org>,Oder Chiou <oder_chiou@realtek.com>,Liam Girdwood <lgirdwood@gmail.com>,Jaroslav Kysela <perex@perex.cz>,Takashi Iwai <tiwai@suse.com>,Bard Liao <bardliao@realtek.com>,Misael Lopez Cruz <misael.lopez@ti.com>,patches@opensource.cirrus.com,linux-sound@vger.kernel.org,stable@vger.kernel.org
Date: Mon, 02 Nov 2026 13:04:24 +0100
In-Reply-To: <auhdJGbYnY95tJBS@opensource.cirrus.com>
References: <20261030170416.1839402-5-tristmd@gmail.com> <auhdJGbYnY95tJBS@opensource.cirrus.com>

On Mon, 2 Nov 2026 at 09:51:32 +0000, Charles Keepax wrote:
> Both paths appears to cancel the mic_work twice?

Yes, intentional.  wm1811_mic_work() can re-arm jackdet_bootstrap
through the DAPM power-up chain (force-enabling MICBIAS2 triggers
clk_sys_event which queues jackdet_bootstrap), and
wm1811_jackdet_bootstrap() ultimately queues mic_work back.

So the sequence is:

  1. cancel mic_work           -- drain whatever is pending
  2. cancel jackdet_bootstrap  -- drain; if its handler was in flight
                                  during (1) it may have re-queued
                                  mic_work
  3. cancel mic_work           -- catch that re-arm

Without the second mic_work cancel, a jackdet_bootstrap handler
running concurrently with step 1 can slip a mic_work re-queue in
between steps 1 and 2, and that work fires after resources are freed.

Thanks,
Tristan
