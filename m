Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC339AD6
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730512793; cv=none; b=rRv8oaRL0nO6L4O/djajJjwSWrcXOYNCfqx8StUpJkMg+dCFh5s+MFBZEOQieTao3tSFK6sDR7wgCRruNnL2HDLzYysS9Mbolm/OLiDtQD6vtBoW20u7aladRkmrs1Xmtk1EV6VE0Uj+Cemcb6gP2OoTzyWHooSgaIFUujHg8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730512793; c=relaxed/simple;
	bh=Y1k9M7xoSJUo8GaKx70gUeJ7uql7Sqj3IP2urSdkizE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ov06nnbtQBxGGJcGpEOscigBHbFBxAuDghzn0H62dMuQfThJP8mOcvtCP07/9kswy4zLL1N79M2T7ScDpSUi8pD2O6s+Ev2ADaZqxgWF0NoeMMVzKo/UC5pVXEPEY8AwBbm8+Lm3unVZgnHXvM/CgQ128NukY/YCwqA7yEK27i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=roxY2gDN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LBi3Cz6x; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="roxY2gDN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LBi3Cz6x"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 21C2B114017A;
	Fri,  1 Nov 2024 21:59:50 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 01 Nov 2024 21:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1730512790; x=1730599190; bh=Y1k9M7xoSJUo8GaKx70gUeJ7uql7Sqj3
	IP2urSdkizE=; b=roxY2gDNTw9gPXrfvoX1PMYm3xDT0R39/9OhjRCMQ3B1IqnW
	PaPgiNq5shX1MOExM0cPO8YQp40gpdZcmTuGH3xHFAZ4xD/LUmDnJfghZZO81/Kf
	y+POviwan3dAPL9fFNcRkQLUAe931lC8E+ErIlMaSi4n3yt1mjRcfPI7mDod/kdK
	etlaaGTDUTMLP63/bYggNf+2aqNupLnFewSt/EGovlWPUPHhTL/iRP24GWKxZCVY
	GwV0bQ8j9S9W1cvu4BBBzrJFNQH8mAX/hQqtZSjnMys/VkBGqH+7ifwsTLevtjKJ
	k9H4GeGonfQ1D3lzwPOV8uEkiiTDfrY2BlKy8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730512790; x=
	1730599190; bh=Y1k9M7xoSJUo8GaKx70gUeJ7uql7Sqj3IP2urSdkizE=; b=L
	Bi3Cz6xeGd14DjVyEARVTE4nuaGJucSZeCGMQkrNnMMEUNp7eYjVaFh6imIhw+jT
	851ldZ+KwFyt77PWteLgCBwzVMy1XZcdEJRbcVNVRIFuOtT+Gk4rInmHswjOiph0
	ru1NKt0AC6WtB0E65PCRCkaLu/kJ7ZGQvkK5ZckoiOPeIbV+l50F//44U1XDoRgD
	w77xQI1fIF0PW8y+LibObug3FZa9bp80Re33cFOVxA6tyadPJInVzAXs3/24LaxS
	j403makQsAL+KppBU1qrwokjlhnd1bIwEVWkoFeDxKd8YpWCNbVuuf/P4hntJ5UB
	sY5W6V3zhau9zNG8HqcuA==
X-ME-Sender: <xms:lYclZ0rZL_X4HrVlr7SgUWcmydzBOvh5QexbFjA_4cJUhmkvcS4kgQ>
    <xme:lYclZ6ocxiYgAQrw5uQkQQvP-rqit8VXOdxSVslbb87IbhxlTXOolPAucZyAqUe72
    MVjmdA5B3IyxAQTEUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeltddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfvfgrkhgrshhhihcuufgrkhgrmhhothhofdcuoehoqdhtrghkrghshh
    hisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeghfejgfdtgeek
    ieffheevheeileevtdehvdeuudevfedtheeutdfgtdeluddvleenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
    rghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhr
    ghdprhgtphhtthhopehmrdhmrghsihhmohhvsehmrgigihhmrgdrrhhupdhrtghpthhtoh
    epthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhouhhnuges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lYclZ5NIM1Bboo-FvXpOUxq100iDjOube8RX9dM8Eglk-6YDMXKsgg>
    <xmx:lYclZ75kcd_houTFbjgxEZz9DefCtMz-hCz4yqCgrUp9NKtb_UIyoA>
    <xmx:lYclZz5dNuPgHJEHp3_z8i3xTYldb5yb0ZWa2SY4R_4868Yu3h4Cdw>
    <xmx:lYclZ7gD-s_KL7orQydGCy0l3EEf0o_BG3ilO9Swlg5kfwQ_ZWhlfg>
    <xmx:loclZ1koys6LySUjpuEg0qNXohL2uTe3DOqeHL9JU5GsRfe38WKxH_MD>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0B7B3C0066; Fri,  1 Nov 2024 21:59:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 02 Nov 2024 10:59:28 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Murad Masimov" <m.masimov@maxima.ru>
Cc: "Takashi Iwai" <tiwai@suse.com>, linux-sound@vger.kernel.org,
 lvc-project@linuxtesting.org
Message-Id: <c2f622e2-0950-4c84-a86b-efc576c0a91b@app.fastmail.com>
In-Reply-To: <20241102012029.GA446652@workstation.local>
References: <20241101185517.1819-1-m.masimov@maxima.ru>
 <20241102012029.GA446652@workstation.local>
Subject: Re: [PATCH] ALSA: firewire-lib: fix return value on fail in amdtp_tscm_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Nov 2, 2024, at 10:20, Takashi Sakamoto wrote:
> The return value should not be from the err variable.

Oops. "should be".
