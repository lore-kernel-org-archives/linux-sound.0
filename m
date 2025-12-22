Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7EC32E698;
	Mon, 22 Dec 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420342; cv=none; b=OBEi+HZexqYJo9VemE4Y2hIUkV+bTeppQiepMrLqtyxsjd/TXF2BcHcq457DeJykYwaR3e9yLhUkZJ6rVAx3Hog9CBHlGpwauU0ez+II5/Fhe3R1RZaqH6bnB3F4jNEiiEtMcA6PL63qyUq1Z0xQmPmK7PL0jTXvEcl89RpB1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420342; c=relaxed/simple;
	bh=PfLjGt4ILvtHBKymPMS6ul5a90UcBf84tYBUCNfdu+4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ADKyts/xQca6IM/aNx7tcS+1qJa9pn9+Kky8i0AiZ2jFeQG/zHEBJ0Osj7a/ccypW/BjbJnnip+/34WnNrwfmrGKWVZVOYc8NY3EQvin0ZfmD+5UPqE5wRdenmNkanwvyhbLts3XGK2GgkdoiGGpTDJDjXKr918Q+7J2z9adk98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nExDy6ip; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v0VPwC2D; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nExDy6ip";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v0VPwC2D"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D1835EC00DE;
	Mon, 22 Dec 2025 11:18:58 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 22 Dec 2025 11:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766420338;
	 x=1766506738; bh=+TRtegKusBZuDP3wYEst9VXFu3lvOUyuyn/E3Z9nZgY=; b=
	nExDy6ipWdxE+xADtBRQsPp1dsstUjKaTlYxYLdTHBPtDvwiXJYQLJWh9mAHxJL6
	6NeHoj4I3NIGhqEdNzezdlh+fd3s9fW1KtLRsC5htN/cN+VeVz6WQwUiXUR5A+Wr
	ZxNE/OqpCLDvWQy/hxjfh9tFJzOucuE7ce1YCBABf1w05osWkXEsAHvUSFoutBBs
	ruy8tuw8auzDBCupNGJgInLwh3UveObiALHDCGZG3grxbcPOR9yogA5GQ4+Kv5Qj
	CtmZGuF4rfITcomOsCaU1cSwDkiY4XuZChxfL9G6x+DiNuIWxYU8Sl20XKGPycCP
	YB3EcU1YFz/s2VWRVK9EsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766420338; x=
	1766506738; bh=+TRtegKusBZuDP3wYEst9VXFu3lvOUyuyn/E3Z9nZgY=; b=v
	0VPwC2Dasfw5FOUeVr4D3MPl0R+k9rjRSz2DtnfRA4/MazYargWTuRJ46UWXNaPX
	le+4koZf4BMgTmlgL+ThgtWeAHICHRBTqOfck4+tpz2jv4N0ncthoFPhr/oaYl0t
	xYw9R1Eyel5cazSV0Nm9Bq3yhsn+reTFufLBXqGzxp3+QxT0TqszumTVEzvJ7ZDS
	uMzoOyAuWSsirF/i9pJUpJNUg8oTX/HkEUcs0d6+iONBA6w+Q1WLE4acJHhRJLSM
	jywuy5QJo4zm04coWocqhiEQw8qVHXooMaBmELm3wdO7rPTeKelyL97SSUtJ965A
	3rk+BRNapR+7PQoAa2u7g==
X-ME-Sender: <xms:cW9JaeXATCRZmbqDSJ2kWc6ydh4tCG9s9cdarIjyprUNIiQdcrSAXg>
    <xme:cW9JaVazpq6BK5iQd8VU_zu-0Hi04XoJZh55YvxaMQh5qY2d7dGMBp61qyb4Vxs8-
    koVe_ZpYMoEc52Qan6rjMLqUCRtBzz3z-X0aB7UP_PcjesKgX3TKV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjeegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrgihtrhgrmhelheesghhmrghilhdrtghomhdprhgtphhtthhope
    hrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgtphhtthhopehsthhurghrthdr
    rgdrhhgrhihhuhhrshhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrohhhrghnse
    hishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphhivghrrhgvqdhlohhuihhsrdgsohhs
    shgrrhhtsehlihhnuhigrdguvghvpdhrtghpthhtohepkhgrihdrvhgvhhhmrghnvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhu
    shhisehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhgrnhhjrghnihdrsh
    hrihguhhgrrhgrnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeihuhhn
    ghdqtghhuhgrnhdrlhhirghosehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:cW9JaU3xsEmuQWIabub-BBUxkjwU3ST7Q7RE11jDb6bzOZTrigWswA>
    <xmx:cW9Jaba1nz8OAwQNTbnnpb7UskG5z43xKYV8gDXNDJMnlHJODygdLQ>
    <xmx:cW9JaeiE_6U-EBssBB6QEWM2aeN-zYH__08z_3WWtIcKQRXu6mEc8g>
    <xmx:cW9Jaa_FWD5k9guM_9H7dlxfxFcC-nkRDMm9FBYx4fdovSTuTnTDLw>
    <xmx:cm9Jab-FVCTmeeUgSN_5WxywbaPMzAQtL15jnDzTeXew5sA7ZXSBfjwt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03DF7C40054; Mon, 22 Dec 2025 11:18:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgVwluaQAvf7
Date: Mon, 22 Dec 2025 17:18:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Han Gao" <gaohan@iscas.ac.cn>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Ranjani Sridharan" <ranjani.sridharan@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Stuart Hayhurst" <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org
Cc: "Han Gao" <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
In-Reply-To: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI
 restriction
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Dec 20, 2025, at 18:05, Han Gao wrote:
> Sophgo SG2042 MSI driver does not support 32-bit MSI.
> Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> +module_param(msi64, bool, 0444);
> +MODULE_PARM_DESC(msi64, "Force use msi 64bit.");

This does not seem like an appropriate use for a module
parameter. There are very few things we want to use those
for in new code, and working around hardware bugs is
clearly not one.

> @@ -1903,7 +1906,7 @@ static int azx_first_init(struct azx *chip)
>  		chip->gts_present = true;
>  #endif
> 
> -	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
> +	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !msi64) {
>  		dev_dbg(card->dev, "Disabling 64bit MSI\n");
>  		pci->no_64bit_msi = true;
>  	}

The behavior is also wrong: if the system can use neither 32-bit
MSI nor 64-bit MSI, this would accidentally try to use the
64-bit variant and then cause runtime issues.

I would expect the only possible fallback to be using legacy IntX
interrupts, or returning a probe failure if that doesn't work
either.

      Arnd
