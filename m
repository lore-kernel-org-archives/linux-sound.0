Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4D2D47E9;
	Mon,  6 Apr 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490703; cv=none; b=pDxvjHs79TudtX4pN9Yv2obO0KEHbdtjcIiAY4ySbakr3XzZItDgHhtttpW2LRBuZWgmRPKr2dAfUJGidQDNHN3WlEsccSt9EX3wrkukS76eRlLYLu5UxkvCvbGzlHRZGgyl6kUxR6QDYKc1e5fqV9iiimlg7gu3ODMElDNanac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490703; c=relaxed/simple;
	bh=2BO6E3p8L2XnRzZ51mdCioI356vhkynpoC2J0FwzCT4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VjTCPMRY6dgP1x7vHYhLpjB5o49AlXrKncm043GWHV8wsBz5cFVGjclh5oNL9oowbxlWHfrqHqnWrPhuOT+5p/hHsE9DAc+K0PKkjo4+GsMuH0r97xBPOxmJMNRMfVKN5N686iinJXZKxCWXa4yQObXOvtIuRtoPHJVlpEZibFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=mDdc2Ccz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vOtu8WYQ; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="mDdc2Ccz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vOtu8WYQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1ED24140001A;
	Mon,  6 Apr 2026 11:51:41 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 06 Apr 2026 11:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775490701;
	 x=1775577101; bh=lfJq5EK+Dv/I5aZmn31ldi2MhDReU/ybwn7hKkYQbdA=; b=
	mDdc2CczejWd+9MWaLMCgZw8erpecZSe8oSfqMxdBb2tLtZuaFYigP42j9XNsJuO
	VC/Y7A76WVIi6VSlISBExPdVtbRiGr1S77Zqs9d5VeKporlzxSZvVH5bXGeF4nwg
	Y4WcyNOq5ug/oGde3Ia1aRshTSMD3lewGp7/iVBYZizefK9RKHHmZW8IP5Kuu7na
	fTkKY/h9hUbXpZJke+BE11NcoQzIRon3i6J3njq1Y4/NLMxoZWXyiVbMX/xEustP
	kX0Y7U1wxj7bROUKH7BMAQpR1bFmHdq3dv1gPAJS5nNFB+6rPW+ZIRBlfOAmYrob
	/uu5eLoAiLjTQfLWhgKlgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775490701; x=
	1775577101; bh=lfJq5EK+Dv/I5aZmn31ldi2MhDReU/ybwn7hKkYQbdA=; b=v
	Otu8WYQ/o8EycUw2TBlCVMPiYr/a2paf5tbxHweBe5kFPdJc6TZVE1Of+dEpKaiK
	KTQOz6XEhxvWHxJk6bJLxnjCu1pO3Xjte8wwBKX+25Nd286WOg9Mqsk4q3lgesiy
	LmBKmf2ymijH4Rc1ozqGSTRYmCDz92FxP0esVoGz7DTY6fZStq0g3Nuk3Qp71/58
	TpI35i3OkDI4OFEJyoGNCFNZBJpHuUnZh6D0WOCrK56kpXFiOjAlMuhu0uSENhuy
	2bLbOSumeZpTo4qe2wLWOH+OuGYJ28fuqzHiNoeY2RmxpiDd3qb9+RtwQi19CXDZ
	1LNm/xNhvnM9CfEp/H2aw==
X-ME-Sender: <xms:jNbTaQ8fZXbSZ4PrH0Ok2UleTkJLbjP_Jya2kWnl_COpF0FdcpUQBg>
    <xme:jNbTaTiHWMIgxd59y9Mqn4zZNRrZ2HEUAEFadt9gXSx04THY1a5dH_j4kHNBmCWSl
    MeBTgVPJRpShSTCCQUF8twBNktMIlTAAHmIx4Gc3at7a9X4hqa8LUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddukedugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnheptdffvefgtefhveetuddvfeelveektdduvdelgfehgfei
    keffjeetjeevffektdfhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehvihhjvghnuggrrhdrmhhukhhunhgurgesrghmugdr
    tghomhdprhgtphhtthhopehvvghnkhgrthgrphhrrghsrggurdhpohhtthhurhhusegrmh
    gurdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgt
    phhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghrvg
    igsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jNbTaad5BqIFzDJK1-EUN84AU6zY_3rmPCB1mSpjlZ3fMqspgOqw3A>
    <xmx:jNbTaQPUuaY_miWr0yMkzVmaHuCJz9dMawwFQ5GxciHmUnkwxUiM3A>
    <xmx:jNbTadtHIYE9v0i_Q7qXIqwn6zISTkUPO_G1p1eglo_HfDTtc78YDw>
    <xmx:jNbTaZA6UjycVArTg3c3NfhLJkcW0CUP-Bpr3TBX7FBVV7sSHR1PhQ>
    <xmx:jdbTaedwGVZEU6vGIHpN5FHM-gL6c2MbnGNcIErTJI50ziavj08gpUCE>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 81EC72CE3F93; Mon,  6 Apr 2026 11:51:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ax0gDzDEZlbc
Date: Mon, 06 Apr 2026 11:51:20 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Mark Brown" <broonie@kernel.org>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, perex@perex.cz, "Takashi Iwai" <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <456cb9ff-e4f2-45cf-b0a0-14c052016c6b@app.fastmail.com>
In-Reply-To: <177547746630.46304.11552848355240705769.b4-ty@b4>
References: <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
 <177547746630.46304.11552848355240705769.b4-ty@b4>
Subject: Re: [PATCH] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW
 machine
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 6, 2026, at 8:11 AM, Mark Brown wrote:
> On Thu, 02 Apr 2026 21:03:25 -0400, Mark Pearson wrote:
>> ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0
>
> Thanks!
>
> [1/1] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine
>       https://git.kernel.org/broonie/sound/c/80a7916ca2d9
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
Thanks Mark.
Mark
