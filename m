Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560803;
	b=SgJ3MEcHAYpm0/H/owRHhGRWNgQSyBwTsyFX7ZjTbNCLgP6NUs4Uu3zDDXISsL2fY/q+
	 mU5tKPq+QYlEyrQb5qY8vI1ilFBLiCSJsnzbkXqFJ18nCq67TWElbZnv2WzQ4isrOkViz
	 xqarMLC5OijXCN4OnJGZWW3R8eGtISbZS378Sx23q0ccnfBed912xY6LFzlYUClPswMvy
	 2x9zEz4k+JaWLJcJfucxgY9zRm9TPUSWA0xIOKkDqW0zxFOy4Z11LcPHjCmQ0A9Eucqdh
	 mKaM1d2m1P1iG47Q0FIeADjRaXOFgI2QNfTHHEj6mCLrq8h1FFv3FodFY26wQ46++7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
	b=3hYZudxqvn6orkscUr5/vXMCrdFeVm8tX5cL82mZO8wV3piOYRyQUfCyJxdOcfr9dVUj
	 wUBlDmn2FwL0kRlAHX97cJOGv0AxpP9Uf/EVkRjkvpHUbEel6SzDk0mFRxh3s60+dzKpV
	 yAYpB/mshdcBAtitCOxR1XxKdnpethwY2FzdGLKBFIup6O0uVPGoaRikqzIARSX9yUK/F
	 xbBvmFaIwTPe1+TbyM/H/ic3frjYuxBYzp5u3cnLZ8kDURuvDaAYAUR4iIXlmTBH61YRQ
	 SQx1KeJxnIh3aqdM9fhCFjURxNtohR9txvnWou0/c0eitqJOn3SoufTvw3qD9gHXUjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LD/kQkxN";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1773606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 09:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1773606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LD/kQkxN
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so571738c88.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560802; x=1795165602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
        b=LD/kQkxNUSUYz5GtHET+4tkjmJ1aM+dLc5LFSvVRdL8gI36pz2MfxpgTVXcDGovrcF
         RK7AybNnjXY0CJGK1faKowrPJRWVEd+LVcjmJBJZ+OLci9TxbtvwWeh1B1MIbHpICHsC
         SKI7SsGmQEmIw9KaNxhIcqp9r2Bu1yWyoyGpgRXnr5lJjJeg+nTBy9JBMrtVVRy8Qd3C
         5bleGrQzw2C0eEoD3g8YkOaxKTF3xlqz3JtprY78XKLptrhanOPH219EZwk/KaG06J6Q
         rEQ9bRyMvkuvu+SH2eUcqYv0tF4HLWFsjnV9z0UgSoO+0VqRzf6qpMCnF+L/f9vxPsLp
         /2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560802; x=1795165602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR4iZDKf1+Vf0ovm389mmcqGuYYva2In1RmaTbco9xM=;
        b=rs57wdl79vNYuyM9D6txMwqz1jIWmXtDkm4h+PAPJ1gEP3k/yan2u0B3KfpMHQ/Lm3
         3BlPH0MOFrzCSH2E+ijZJ+S3iOhfrFNN0GXkqmkoh3jCpKqqECGppR4VwOUEQ/q5lJAc
         YFtfXkhW0reTelZLPARaQ6w0hSGRZocd8ii0a82ksRbRlZZEPKfdY4pHnd595+KHoP95
         orpLCmsRmGhnSWILvL7PTY3FNpud3xC7wMceZAfVJAwEcHAIRStijXdMl1WjZqD5TfQQ
         LArYAGDl8LCJM5DubHRKbIMJENpLnXtqu9qC+RDBlSgTTikIOiQw4959ilNrixC48vLU
         g8fg==
X-Forwarded-Encrypted: i=1; AL+hErEctCHEU8+Dceb1/Au4kwqq+ig7UUFW7B8bH3FdfIBQV3WJtQb6n9w66rwSE508RAUaVWngMYikci/C/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UIGdl94utVWebL8IdZnKb4mrZZv5ZPvO4hjV9rhB8xekHGxoK
	mDc3mmiAAx4Mha6jqHA7nVWdQIPpzhD8pHwKgmAEb3hRF8zB9pht5azOG7q6MpZp
X-Gm-Gg: AYBFou1rwSU+vmwGGr9nSyWHMNWHOwS2R5ioc4CS8eCwc+oROtPFfwB3y1lBPVZ3Zgj
	iRA0VkSYC9pp47ZmTVRVo53oXhUfplYbb3wSM0YCeR+XZlh/xGEaCdBcjzNiNLfLGVeQlNFM/+L
	tpt0Gd8mZnYpVxckmbHJdhHbw+QK8AGysNUxC0ODTWBFz3NUjocaPtJGmU4ZkkKKla0mJ99suCa
	5gOwCuE3xkaPAO1KcuWtfcg/YEfmzDm/RUkXV1xbwTCwo594D+wQOu3IdSdqSd+L1vgQe8aggG8
	5oNgwovhDxANX+hnrSggLslUREiyNw5K25fsBwY0oZdjhNRHm6QVYik919g4Zsnf+6xiqNePRiD
	CF6UWz6I78aL5JY4ONFx19Wy0b9Mu7qdTYxnSe8r8zvLcd7ynOikFuPo6/uRifcwmnAFaxVfuNl
	d/ZNVb9H7XlK2jSboYtzMgR/z8anx4egNDbEoy9ZmBufTRLPndmujkGpaufAmm1hnMHYOitpL5Y
	7Vablm7nU5nKHNaZq6Igsnzq7Gq/DDGJaUyFLaautbECNKoTFOJAzVDHzDT4M8bz5qhlROgTy+n
	yAmBK3p4yXwBepA41ulFBeaguAlUTY6dugVDVCObQFSFXSjFxhOn
X-Received: by 2002:a05:701b:205b:20b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1b50313ab0emr1801317c88.38.1794560801726;
        Fri, 13 Nov 2026 01:06:41 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm5522272c88.6.2026.11.13.01.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:06:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: Gentle Reminder: Pending Patch Review
Date: Fri, 13 Nov 2026 09:06:19 +0000
Message-ID: <20261113090619.2873-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87bj7tqi8q.wl-tiwai@suse.de>
References: <87bj7tqi8q.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the update. Understood.

I'll wait until the procfs refactoring is complete and follow up on the patch afterward.

Thanks for your time!

Best regards,
Sreeraj
