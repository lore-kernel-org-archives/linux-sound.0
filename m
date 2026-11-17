Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875188;
	b=jeBgXWDyLIXXp891I5ngbFO2NRtXwTAromd78Z1MIBogC2nfZx2YmUecS6ysmrSYx1yN
	 uQ9VtMWJqLy/K6NnIRJsGkuGon80MaSq4wJT7YN940QQmGliOfrTn7oR3r1awZ53IWIso
	 Vt+EYfqy8ltAoKcy8oKe7HW1YJ59Ys8FrSqqL3V21BlaflBA0O48z7rcYjZMvhBy4NVOJ
	 ZoFoRHrmlBmfW5/fGOOKOQBCeVbp7gzpY8nB7XiRjZMZzOlpda58UG2RypZ+sMLygQCE2
	 acKAUo+exVvGH/k3hfS3nknVbZXwCjbNpnujON7Oe7iGNX09yV/hcpm/DjS8YwH5/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875188;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1IF7o/AtrOMvQGCYw2joPZttg4edu/s8LsP4afvyeNo=;
	b=n6gFFjvr9WFRqmLfiGm+ttNn9iRHV5KTJtbpEIHpV47iiHb9YYN2mL0ybiKItN+nlWkP
	 LlWrDVR+QcSnS+N/10LuPovDvrvggSHNdfDRCletmWJX6xJjWqd9n01cw4j7M+VNv3w0A
	 hlM+GdAbVIJ5TMaC6lo1aFBpcwVZc/b7LfCv1IdHR2Fk4cGEpLPSH0AFxMyllrfCrdNe7
	 bSr8bX8n8Nfl91vZkLeAZTv/+G5KOLJ4RPF4yko11sdeqXqsobQXpJ1BRmuT9O+DhpZDU
	 bHdPkvHm6S2Ee0C77x/xxubuYwiJnwXUC425PE46hx9z/kaA49a84D5hmfUOtW4NTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E094606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 00:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E094606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2243613a12.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 16:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875187; x=1795479987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IF7o/AtrOMvQGCYw2joPZttg4edu/s8LsP4afvyeNo=;
        b=Uhqt6ErijKw54A7D9AE6fVn76CBaTliWBbkuxNeH+BYM3ayGIPaUHHQS7WdLGdaWCA
         WbNxnjUUecPLd0Gt7h2bofAz4lT+62s+trLg15fW3KOQU4WncG0HTJamJByVIFF2w28H
         whUlGU+GyIL6gt+jxqE8S5y+74+1jejMhD4WWo/wmygEkow84meVyVmLmnnoMW3G1J7E
         vNdnwsdxkdXnMbSAm1GIXO/qcZ4TT8Jyhfa2PvDffjQogx2MeFOlPNzD/1s6R9jEaCx+
         uxgty8fGfWDe7Cw+tIGheaD4cuqNOBJIeGJE+HxnT5rjXyDyZjJxwVS11s+U2M6ce46U
         fA0Q==
X-Gm-Message-State: APuU4Z89YA0JiECqyGWXapAQsEyAIllqqnXl+p20JbOvw1wap2tqquBE
	pEGTxN9BD35O9jVkQQS+n+UNEYhXPIxKxeglulw1CHG5ABjvelyaL3Mzqy65IX7w
X-Gm-Gg: AZFdTZdhO8GOls463RHcZLfnBoMFkMPU/KV2KfuysJ7Fu/GYp89p2dQbPaEmYLFX3uF
	TsmI5WSse97JwIJj5oXKDlsz40JEPLT1l9hOCBm9teyT29hL+G7BujnA+4kiyJoV5bqyEbA87pE
	HL1zYCkiiOP6NblQjq2IZh++OgagBlkCnPaSRN2m9FwMpL2XmSHxLS5iNyPrLUNb+U2BPu3fzmd
	OPC0QpSQsZ3Tir+2rTwcsdaY1cquc60i9BFFOY0XrrsYhWxUSA95cSn1H3irO5vpZmAuxAKWZF+
	1hg6j+eMkZ0Dwqmal3Xwtdb34vp6e7gPOva4tcL0Es8rYNb2TW2sbLPULFK4ZKfm4PjT4XFUBU+
	m5PBtDnpdJOeATUp/G9zQ8uzY3bZLujhJUoT/cwRJA7xTM+lPTgugBjxCBX26tX6wob5lVn6tam
	B38OHr+3by1pLm/lFyR0KhAuSGLD447+6KEYWn+cd+akb4hkKKSH8cmca92A8QC5WJ+1hXFiytx
	xn4Wto375QHUEFpMp+eQZDGospymQDRXE8FLCN25aVehDZYIS/s3zaQXRks59OINnnjsVung43A
	KZr3de1yUNJYFjf7WQ3KECwiBef9r8c7aGLce9RuTKSaMToeHnWa8yY/sRpNcZfs7vqW2vVtxOD
	+jVt+YUkT4i57uoYqbuIN54VM0+us6mSise1HGi8jUFZf
X-Received: by 2002:a17:90b:580c:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b1b0b50028mr11949608a91.54.1794875187172;
        Mon, 16 Nov 2026 16:26:27 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm1202420a91.12.2026.11.16.16.26.26
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:26:26 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1834911eec.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 16:26:26 -0800 (PST)
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id
 5a478bee46e88-37b7bba83dbmr6574275eec.6.1794875186398; Mon, 16 Nov 2026
 16:26:26 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev> <sashiko-outbox-217774@kernel.org>
In-Reply-To: <sashiko-outbox-217774@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 19:26:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ626GTu3Lvb6Fcn86BARRRV7YYg5=dcTmFt4L=QThS29Q@mail.gmail.com>
X-Gm-Features: Aa3M54pgjWtyIXJ87iOCXvH7VHiLmPfsiy4hpiocOy5UhsnAmGKWL7LVFibdBLM
Message-ID: <CAPY4CJ626GTu3Lvb6Fcn86BARRRV7YYg5=dcTmFt4L=QThS29Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026, sashiko-bot@kernel.org wrote:
> Since this fixes the 7-bit mask introduced in 81da6a9e49b9 ("ASoC: OMAP:
> mcbsp.h: Clean up bit definitions"), should it include a Fixes tag?

I left it out on purpose: the only set_clkdiv() user divides by 8, so no
in-tree user was ever affected. Happy to add it if it should be
backported.
