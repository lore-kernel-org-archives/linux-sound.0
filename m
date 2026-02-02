Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AE28F948;
	Mon,  2 Feb 2026 22:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069664; cv=none; b=fvwG84oibVm8QL5i6+kfMrK0BVwnNkOPqDtE0r3jjVk8OYMiuYorXZkvybcw3qkQ+BS0na7aNpUj0XuCSuAjhk9P2mdiNTjYWUZN04YfqshBvi9hysciVkAp2X4ZyoyIVZ5cbLGX0iOVLjrOYrXev8p9gAsG8XBIpJAbmbX2AUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069664; c=relaxed/simple;
	bh=DDKk85eqACfiTKWSbKP+J4mZXYjOClfSZ7QX0us5Ulk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bkod/cjZyh8CDMLKQyD9ezlHl/BBaAKwlexOYnh9bCWYN1q9PSYPj/qnkAAUqBGtMiDACJOR8L0PVqWnuUTQRIefPfsTA5bOOf/rt5ZMwMEfOXZx/G0ACl0xRI2kvloMeqJflIuVuuFJfGc05BqrQZpzKVOA05AN83P7Hee5+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=qi9nINJc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MYdZAWaF; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="qi9nINJc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MYdZAWaF"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D7E214000FC;
	Mon,  2 Feb 2026 17:01:02 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 17:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770069662;
	 x=1770156062; bh=WvWGehjhJ8iTJpewMTVueQnlqYtYFLWEyh89uyLAoVc=; b=
	qi9nINJcAgQJnciz3jtLSm9KW14//k1qyZ59sNpurAQV+6RnmqcAEl2VfYC4FhIs
	3xnb5SN/ptN7a03AXyup2i9Xl2JIr1NBkLvQLwZC7kDPMbXfuCCwRBOWOdnXQ2BX
	Q3cZXspLKaUDXPFb7j3rWF/DY/teiNkPTj31YxVu9mRQ+NVm6ktWnd9lwcobqwnN
	xagwYJPariYSpkceNSQ7QFNDcHDgdB9mLmwyrvpk+4zE1kp2upX3tNVYlQg8jIml
	RJbw6sY3ouWf5n23j1ZboSGo8QMqyyFBNow5bvirGz2xUKjVkv+hOwS5Bw+6bLWe
	stGt+/LbZmd4YuwUeSMq/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770069662; x=
	1770156062; bh=WvWGehjhJ8iTJpewMTVueQnlqYtYFLWEyh89uyLAoVc=; b=M
	YdZAWaFDoHK5lsggE8lnGuNZrSKlWneh+lJQCkDYWAm7j9QLLO9Hj56iMWrEo9mY
	t3FP63sdbdieYvUb6YSmQI6SsiCpfTecV5aTmySl9OJ7loLLTYX0Ej0RVYtMYqHB
	DafW3F0PdVg7K4Mfxl29ddVLqaCIaXfFsArrrEdJH3f69QTK6KaA3/T8bRNRZFH2
	jaVQf2uyhinmB8YvtVJElZ+ncbaFNsZRfWvNf6XH+zKfyO5wWQYTw4VQjjzgyoLm
	EjhydxCvJbt8k0AyINfAuOJBI/1gjGJ7vD67yqyZ2tfUpTf7q3PiUqRCA4aDgqgH
	bwgXeOVbwJU5QG2Pq/UxA==
X-ME-Sender: <xms:nR6BaYNXhdcDykMQou8VC5do2Uey_Mks2m6ySO8GuFJlJsc_JumZ6A>
    <xme:nR6BaZzIuLJzo0EhEU-nIXnU-y6OAMT03pNH-2CQ0hTTPEGo9mXVYgO_tXVtU8ZRN
    He1HqPOn9dPiwlabAEIDXibevMGDuM3WMl4xk-vqYBcxAWXgONUp6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeekjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthho
    pehsthgrvhhinhhskhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhlohhokhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:nR6Bac9JZpl3_xDwH0-5Cvpgc76HOJ-CI-a8IKSC2e1D8i_VpbHYjA>
    <xmx:nR6BaXRHZfYQjgh8ptW73UFWcBxqrX6Tj7BNrXt2mWbWJOFV7YEodw>
    <xmx:nR6BaVp5X-UFh2JK_VnuQwsrgGw8JqEWqNBIzDq-06kyfUc3BHZXlQ>
    <xmx:nR6Back8Mmmmu6WNT-n8d9PWjTUe5jlHluL5Uck4YZ_fMR_fWarvTQ>
    <xmx:nh6BaSIQiKiwKhtyKZ-itqPfmKUIQmUuVEDUd99Q3Rp0KeGHyEIgqvQ4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B7FEE700065; Mon,  2 Feb 2026 17:01:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AzM_vmibOHWB
Date: Mon, 02 Feb 2026 23:00:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Chen Wang" <unicorn_wang@outlook.com>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "Anton Stavinsky" <stavinsky@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <5af7eedd-c587-48c3-8562-5bcb78d7ac2e@app.fastmail.com>
In-Reply-To: <33cb662c718507c6ac747af4a9a3f5af10fcf5a5.camel@gmail.com>
References: <20260202095323.1233553-1-arnd@kernel.org>
 <33cb662c718507c6ac747af4a9a3f5af10fcf5a5.camel@gmail.com>
Subject: Re: [PATCH] ASoC: sophgo: fix 64-bit division build failure
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 2, 2026, at 22:31, Alexander Sverdlin wrote:
> Regarding the 64 bits: seems that the actual issue is the tmp variable that
> is of u64 type for no reason, because priv->mclk_rate is only u32.
>
> Maybe turning tmp into a u32 would avoid unnecessary 64-bit division
> altogether?

Ah, good point, sent v2 now.

      Arnd
