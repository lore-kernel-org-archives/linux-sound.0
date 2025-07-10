Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D51526B2D5
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.62.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134574; cv=none; b=fbXjt0XNEmJLDpRHqyssIFYHg8N0rTf3pr8HlarA4KpmpEJjl+4tylfWdYpTWZOStH/5DjUwDvM06XqjEmyR4SavItCyerVmfw4057Dm1ONZ60nWY1/wdqYt4xfUIM3qN+Cnh32tVIsxCVA6SZYfxSQKb4f3QiT0CIBTnTZ/ghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134574; c=relaxed/simple;
	bh=vwkFwjpE+Upplw8PdIDh5qpFIDC+P4YWqyGX/LC2JuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyxb5F3tGlsqqtbhHny86KHokWv73HJBsdiD++5wrw/uGKXmjh9gCvNeiD8cHK6iLxRJH384Ipi7fbItQmqfNo3Qi4zh21V9j4VEohzwWhXftUT4O4zvIBveiyOu2t7DFzcrXXTZ+Rf04+Sde5+mhcDFK7dSGidooNDSd7XcNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=114.132.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpgz15t1752134553t6f595ebe
X-QQ-Originating-IP: TMeCWw3VhbtL055KbbMrtfQNlR6MVhF9cJq+MR8ibLs=
Received: from localhost ( [183.17.231.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 16:02:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7094107306005909391
EX-QQ-RecipientCnt: 14
Date: Thu, 10 Jul 2025 16:02:31 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, like.xy@foxmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: Add schema for FS2104/5S audio
 amplifiers
Message-ID: <1817574C54F0A79C+aG9zl_ERp5hbxwer@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250708112901.25228-1-nick.li@foursemi.com>
 <20250708112901.25228-3-nick.li@foursemi.com>
 <20250709-hypersonic-piculet-of-fertility-7c4a82@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-hypersonic-piculet-of-fertility-7c4a82@krzk-bin>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M5aCtjAndv5OYA9hdyvTi53Y4twhpkmZzIiDWj9gh7b94i000AQONuMN
	BIDuuDIX0JkstXJetfoW0NZY0eMZCf3x1GOZtM7mw+CHlQ9RoX9Ivkmna4VD0wpKLBD2AlN
	gw2roniSqlJy880uxwXTaz+3e8DForeHqdZcNzHb+43Wj91MAQ/WDBAU7LhGLqKFN4r/t9I
	Wop7VvJNkr22p6h2Ptgwd/uLNaGk2gO/YK9/+4tuNkJQ1WeH+iVxQZrzq3RJOYhq1H/vgoQ
	N/YVbXJM5IoPfj64QZZhD0U55tz/IT5eQd0wH4/6uEafIbcyXn1cza3BRjrnm/7saR6LxN2
	j8BNP7QdXxn8Z2av5THCkzS42iTd6jJzISXnAbg3M4PoNswxNuuSFd3bCpxw42t8s6svM6u
	9KR5KNGR71CVPkBKIKXlcuNmvaXUMjNa/nlZZScu8uK/zikAyMOQFk6BaDl9RvBE/01HsDX
	AEf4os8tcHJqwrl2tKa1X1iu8IVDK5io1ID9qUEqN/Ev4kysMju9tHSPwVKCMEU0JBA36Xc
	y3zuAuAJ4XjNdvxDMkURpj9KasNWLvfmq5ggTGEzs6Df2fixzo1Pjijg39SNxaxT4EXB81D
	1TBopdiboQjOBthUbaYI5fIySo5FIW7gB2ZBXBm3iD+raA4gmA6ShzEnFrF6EnStllwfwlw
	49YomPL8vSywWLLjZIU8ceHiTkvhguOk1NaqmNl9AC6f+czJ5zZ6Q7U8kXjn4NMaFgVAcu6
	KyKRCUGV1gf7/eDdhof/wLrA3AXsohVr26+qShrDP72+mhkH0y2elaNyMFU+wcuLL+KEWr5
	6pvdffJ3PIbuF7xbWpjKN8IkcdyfBN8qEK+nJJn58h9Q1MnwWNgxO/JY2I5zTRt0qs3Spnc
	Dx9XVcv+UY18MT/B5KnfgTq8GsTXH9f8x711dFYEFN5d2VUoT7PrW5drCRwICVpA382/X6F
	KA38bOBdjKmVUVW7tokqEURu3UzqUaK1GAFbFT3EArH6OMz5kfsGXlmrbwG/ET7SQzmS11X
	jBp6sDKSELMLIzC2mKb6WOzVk642YYQiNvrr0cVS5QJSkQVe0q
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Wed, Jul 09, 2025 at 12:42:35PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 08, 2025 at 07:28:59PM +0800, Nick Li wrote:
> > Add a DT schema for describing FourSemi FS2104/5S
> > audio amplifiers which support both I2S and I2C interface.
> > 
> 
> Another unexpected change from v1: subject: why did you add "schema"?
> 
> I asked to drop it and gave you reference explaining this. Did you read
> it?
> 
> So again, same template:
> 
> A nit, subject: drop second/last, redundant "schema for". The
> "dt-bindings" prefix is already stating that these are bindings in
> schema format, because they cannot be anything else.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 

Sorry, I misunderstood, I will fix it by dropping "schema for ".

Best regards,
Nick

> Best regards,
> Krzysztof
> 
> 
