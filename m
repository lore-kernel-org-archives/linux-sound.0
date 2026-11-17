Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918304;
	b=BM7R7DfyrdXyGbBlJwWR7Isi/oP1dl+LYew7tgR/RTGmqAFli0mc8+MTMiDbk9/l0OlR
	 sJRRMswTp3Q2LKO8/mGDokyEPDM0HqcdpfvSW4nGnS4LJoJa8cRt/LB4H2CayXgRWr+pO
	 EzG7my4A+l42H+hXaAc+jica46Hmae7NYiYEsBhzTLQDzDRWaHXJdTYBhASTQeaA31EU2
	 w8zJ+Mfs7zVgaVHOZzngOtyd3EfYiYNChqAzfVuBPusnbPWFDcx3RSxRzDPKj5RxRt0gX
	 FdDhtbqQH4nLi/ClrU5bfn8tjdjkn4570i69jDZJ3MKgoLIErhk0V2seywgm+Kj7n5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
	b=niLoj6vFvY8MwWI87Sm0mBxNv4EphRkWKvphh5Jvu0xV3RG/aXs/KVX1dTYPkVbJNIE8
	 wMAFRUTFp1hhuulmlNViceqL/+alxbjP757fZMtOrxRdKJsQfW0doW2onHIAIVcnumjMd
	 WqW9rufOHe0YVInzmUVcRWW3gDt6oq7LYlmzo3HuOR7g2ptOez8u90S6r3EC1TCjqUOZc
	 XQ3kG5ahrgFAGEInY0bzOsN+VYKCiDILoetdui1iEiG8F7r9wwMgsS3J78kopc42lfaqn
	 luvHuMYcD6FawvC73KToOf/4a9KpDy9DVHDCxMOI7wgtaXJgdjqZzlUIet100BAWkbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+ycRSf2;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E7606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 12:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+ycRSf2
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3bf3bef9aso256755a91.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 04:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918304; x=1795523104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
        b=G+ycRSf2Ula43Yh/kEvsvmD4oWnif+OT//3vYs9KhggfF79vBUPXqhykPZIX/AaNJT
         Vk/vIaK0AbsgLH9n9j7vBOHXz8NrtPRKtFd8vSgyL/DnCzXnlarteIV8C4kBFWkl9nzF
         V74lpXC+9Fdn35+ZsdKTT7SszTJe5kv2RzYkqQ0WBPlCY9/mXqYGKqtPDsLQoyD01Hcp
         guFG4os5ptKp97uzmcvZYVgfMrXG3lwvNw/LXz75J8m4yBa0NIErZh0nUafK5QgWQ8PF
         mQyL6ZJZv1AG8p9p0+7+q3KW/sINMBnQQGSJsI8ddL3+No4KIN+zDIlQOWvjkjk2ayRU
         TMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918304; x=1795523104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
        b=cTNm9MyMUKtVwVoDDO3eOs0jGqMznFBDfCH3BCreMS65NUiV2TrU7rlRFKJ5D/UZ5g
         aGYMWrygegA9cBgpj+y8pOh+DWQPcQzaVlEFIJzVrqznnt6DUSAGbCJSUY6pHIZi307w
         d0NqR26VUKPsJBfK+qUd1xyRf991+/Tij5BnsUO7rES1kjRWIo4aeIvyKmtu3tj2/jEo
         LBMgTjv03IfNzllWyso20Q8t7ZQVgpICM0vkdSPhqyCArcD6w1eRELDFKprFePtZuy68
         m4J11EeHN3pFsC8CBW2uDJj+N4bkhkI1G6OV+vqKlihdlIpaDlM09Y6d6JpVVwGndmS6
         12QA==
X-Forwarded-Encrypted: i=1; AL+hErFK64UXmDN/4UFmSLwFeKbsQpCQELX8g+5hCKSk7SzSrTFMXPqOHjcCH6v8+me4daG3JNPDnMgMtCmzvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ODi4Unk7LdMr6cpi7tVUG7gUfPiIfuycnMFEtiKCGvindT1ae
	yIf9PVt1S9YorR1GNgO19QN9xCFUsLchT/ZpYUTLr2OYss8tzb7P5JCj
X-Gm-Gg: AZFdTZd8/WbeVEjTtEkM38fhSfc3nG61emBwq9ib2U9AB9VuZsH2Nd6tDVngLbdx+XE
	6eSYrVFVYsGEhNoL3QAhqwynk0pMKQrurAB96MDsd3h8dMLZRdMB9mFeQmvAdOMBhpxhD1s5Qb7
	GCFGaANmCGA2qO1fZRK1Luv+/BaPc8REfCELk9Ik0AZFXSJQeFN+t6GGCOOEMQM21c7carX4vy2
	JoHNTlzSo9iCSkWYJixYnAmekGGMIOj6TV5Z91uEpvufwUVbGcI+pQjr67Qq1/X270a3tkjIsE6
	jrGuk/xiLbW3xFPON7AZZE8pqbEj7aMvEei+2e1P1i0KtT7CJFrRRaXGOhUxfCXz6UX8ikmqSV2
	wQowoj+qGzZu78wGLpaqyxnWoN14NKzM1VkAGb0tKwM1ecc6ICVEG55+qO0cycs1EeW0DyOaKph
	AGxDNvKHd6t1QElsA7uPeOadrFs15Q3vYXwM7grqLbl2K5fOaQdclKchr8T8jW+lQuxCFbkFocZ
	arY846ohScU0jepud86TfgRaOlzz16U3vwLEALaCcXwuKZPLaKZ6ZOiZFLuj2PLHRs7cQSM2Jyc
	bWaMrWtyB810Z405nhzJDR+hvhIWtX5wEjY59WXgYZN4+GXDdixrbOjMMbgYPJdB8blQ6KRxbBa
	44yp4imSP+75TDzgwuKTTFTf1GCNMSdvoopvhUz8I
X-Received: by 2002:a17:90b:54cb:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b1b0d39a69mr13351435a91.57.1794918303790;
        Tue, 17 Nov 2026 04:25:03 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac606d8csm4226371a91.16.2026.11.17.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:03 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC: SOF: control: fix volume, switch and enum value handling
Date: Tue, 17 Nov 2026 21:24:54 +0900
Message-ID: <20261117122454.2448997-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Arnav,

Patches 1 and 2 overlap with a patch I sent on 2026-11-14:
https://lore.kernel.org/all/20261114021730.2349347-1-sammiee5311@gmail.com/

Mark, I am fine with whichever version you prefer for those two.
Patches 3 and 4 are not covered by mine. I have a Tiger Lake laptop
with SOF and will test the series.

Best regards,
HyeongJun An
