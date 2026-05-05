Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33203346E50;
	Tue,  5 May 2026 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011261; cv=none; b=RV46YYEpBf93zFymbdnlQ/Yrm+85bHA7jJqVxCPF15fnjL5j0E00daS3IBec8bdrjbbBGozKN2z+mQ5rxMWLsxP7/uyENc8DgWDE3rhKcM0tYwVs8s9HrNVYkT9oDL3Td4xmHKqFpXfcQzoF9myfL9AVpOzAXov9LhzlDH1Vzx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011261; c=relaxed/simple;
	bh=N5uxZRHA6BFXizjS+J2vesbveFpqD0Ss8Mxqgr6sn4k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OEHOto4pjH9eNT4DDnlD9kO8zaHshzrMOEXoyritsgt/sfM1kW7PnrLRAhhkQhS2zGXWUKakIoeEvlg9yGXUSeSZ0Ee+EistBVI5rK8a4m0eyxJO/heqUABS0Rp1mo7GPkp8GT9hHfA+67xzn5+3HkQYFBmWR75YyN44IhaKYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SyXuXsib; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o9M8oCnP; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SyXuXsib";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o9M8oCnP"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 159467A0115;
	Tue,  5 May 2026 16:00:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 16:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778011257;
	 x=1778097657; bh=slB+JxKgDShuj1onoapW+Brn+Ree9yJxr7H7uqFs8aw=; b=
	SyXuXsibDWmDIvGMuropPfwcuhPTFJasgJ814kb872VG7zz+jfhpuPFklSJmasVZ
	jeG7qjRsdQUicowkJ6pn0IQD2RwtlGUhFGOqo8+rBD/nwT5/nL7K2gQvCHkbOHtb
	yIDwEzRjEpDlrBTGz2zddaxJf+KYA1ep+K0sQwEwuR7uxxobznlnmm1/IAJzAmjq
	uAEM+eDAMA4CUIX8q354pGARhd/xid/Te8rePIY1c53I5Cd22wARMQYFG/+rUzyA
	ijGIYoeBDf9GKhvdIzJc6eeqd74kwy/hdB+CYxChwPsGsee8XTWpXeXarHCevSIj
	la2xgiVMIRT2G0NBiAJT0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778011257; x=
	1778097657; bh=slB+JxKgDShuj1onoapW+Brn+Ree9yJxr7H7uqFs8aw=; b=o
	9M8oCnP6kBiG6H7REmllcEA9vbxYRXHE1YN7XW3T3sAkRrOOT/EGzRkzH9KkqsSO
	Gu84mhwPlwfvO8XD4mz9OrSB4p8WNEwYXyaGLqdsYKWoKGgFsceFe3rGm23UEhVF
	F+2+QvLoEGBOsD9+fJ+EKR7MlDQqQpLY0RpIgkjMDHg/40Cfz+zw/jZ1xpGFDhWH
	/aAL1HnWn5LklXJYKIQ2ESfCae1vlthtwlroe0sdGh2KHtkBhvECxq6rQz+Yiidv
	EcY5gpjGzs/iE6ikoLbprloHotkCOqSHMHu8BkgJWFl/e+CTz7gwwp3t8YfHNU/J
	1yu432ubdd7jd/9WHWGvg==
X-ME-Sender: <xms:eEz6aeEkyL6LFnsv5dbzI1ZOxl-USAD_mcTkY7BoA301IU65fhevcA>
    <xme:eEz6aaKtVAXCrDtWzgNmkUDS5jQlWcFETD9i-Uk3xRbBuYQcogtzIUQyZS_oOVz8O
    li5Ssoq9c4qzQCk0MZWKEird633sZh2cmNAUFv2ERdHeyrUapYpE0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddvieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosggvrhhtrd
    hjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgr
    nhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnh
    hkohesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepthhrvgguihhnghesnhhvihguihgrrdgtohhmpdhrtghpthhtohepph
    gvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhm
X-ME-Proxy: <xmx:eUz6aWCZCSLFciJhpPxL7Pl9dH9wNxs1bk8_VLtkkjuHopEt6Ae8_w>
    <xmx:eUz6aW4MzRRYrXk4pLiAJ-YD4uy7bd0rbvWAm3ofT-A9AX1DU-IOmQ>
    <xmx:eUz6aV1A0WpD5PXRkmggGfhtZTkyIsKZJkabEgw9BjOnB0wNNfRnbQ>
    <xmx:eUz6aSmVFdx6OnNVW75NV-wF2yEIIl2qXZ2xyrF9LWiJQ_Unsqqw0w>
    <xmx:eUz6aWz-ZN1z3GIsnkC4r7cGLjdywdEPEvSDywam0Rp8ZgNwEnxCfas9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3EFE700069; Tue,  5 May 2026 16:00:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A7hCdP3FbXcs
Date: Tue, 05 May 2026 21:59:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Thierry Reding" <treding@nvidia.com>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Message-Id: <ca83fbbf-e7d1-43d0-bb5b-0fe02644c91f@app.fastmail.com>
In-Reply-To: <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
 <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 27, 2026, at 17:58, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:
>
>> There are no remaining static platform_device users of pxa2xx ac97,
>> so the rest of that code path can go away as well.
>> 
>> Since nothing in the driver uses the gpio number now, constrain the use
>> of the legacy gpio interface to the architecture specific code.
>
> ...
>
>> +	if (cpu_is_pxa27x()) {
>>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
>> +		if (IS_ERR(rst_gpio))
>> +			rst_gpio = NULL;
>
> Have you seen my
> https://lore.kernel.org/r/20260415150412.365989-1-andriy.shevchenko@linux.intel.com
> ?
>
> Perhaps you can incorporate it into this mini-series, as it looks like that one
> hasn't been applied yet.

Done now. It was already similar to your version and after
addressing Mark's comment about error handling, I now squashed
it into this:

        if (cpu_is_pxa27x()) {
                /* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
                rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset",
                                                   GPIOD_OUT_HIGH);
                if (IS_ERR(rst_gpio))
                        return dev_err_probe(&dev->dev, PTR_ERR(rst_gpio),
                                             "reset gpio failed\n");
                ...
        }

       Arnd 
