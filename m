Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2854502F
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753164425; cv=none; b=Wm2Cu6DyQNZFoAl3dBvmM/gOGQ+HDMxQl9d5L/2nM/7Vyn+K6QNRM073aPDZMCuiYz4OojwVguBdMeF00zxMuhiPcceeQYHoYnmlDdKWNyeKSNN9cJHtA20LpiIrddD3ozHOTaO9USEWul84No5c/TfGxgB37WNewf2QSQealQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753164425; c=relaxed/simple;
	bh=Ox3IhCjiBYh+MX6ejpkv6y1uIpwAtiQwJ7amkOxMuBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evuHci4jozRlBUHh1TF6KtkAPELhjsDBVeDf/G+wc7d7vfKfmLZsMKueC/35T8KFxt7RwOgfP/dUXWUBhmZVXK4liMfUZTTcDWsGNVFfLHuXp2uwlMecHIyQJZyhw46ceo1EYJKjRJNdLlXVwoAjBeBZNWSGnZeHRmpisRk22+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpgz7t1753164408tad5392af
X-QQ-Originating-IP: lRVZxkrx6pC3u9vYhC9bQPmaTVYkQx9JA3OJjBKNKT4=
Received: from localhost ( [113.89.235.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 14:06:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11910796611481900965
EX-QQ-RecipientCnt: 14
Date: Tue, 22 Jul 2025 14:06:46 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, like.xy@foxmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: Add FS2104/5S audio amplifiers
Message-ID: <F429DD8B86709040+aH8qdpV2gn2Xk_4J@foursemi.com>
References: <20250721103805.531758-1-nick.li@foursemi.com>
 <20250721103805.531758-3-nick.li@foursemi.com>
 <83f7c489-7001-49cd-97a5-4280eba95fe0@kernel.org>
 <F04DD98A69286426+aH4sT_P0GvttoCOq@foursemi.com>
 <ea2f30ff-b2cf-4b88-9fe8-78950a03d882@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea2f30ff-b2cf-4b88-9fe8-78950a03d882@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N0mS+7D7RQfjAzvrADPlJWmbDwgi+0oZ0BEuKCkMQKpUJJmNvZ0ejjZi
	omr4ptXc3OfjL1Dlf9QjkhQfWzIBTb8UA7jbSXKmF4Rgi+HwcoJby4rCsynec6FGxOJLNaA
	NpT9sS7QnuAV70QC93fRM/d6n7omKuitjzoj526o9pu6JIKTFE1C/QP780fvYHxOCh7FaPp
	c7xkk+QxUc+TQD9oNCZCGSLntX8bEHoOFolRfNq2sGlSkyJE4QLXOvYctygkw5SlsncIwcb
	xmL2zl6HXZqc+tDgpKya+DjjcjP9zG4wdHtxXf9juF8ks2MLSjzu9rPzfwlAzu+HWza+ydu
	4wlkaUtTkWuCBIjlEkG84VrxBG70OyYYDlI5rvszwkmtycg3b7LyU/AXztow74tvQsvRpRX
	P3EEq1WbhgTm5FsiKy9duCp+5iikHmZY1OdJxrIZ5KXufvltUar8G/wYxDf3YP+5RbBrMS5
	uTVk9SLADaCmDMZ+FJ8LdibGWWU17jCVNYQpkowwz9Xz1Nwm3rQpxdJaA1ymA0KauOTDveB
	z79QyKK3+8be0bZhTXEHOnzsNUmQZYPoI/wYw+u1DH4oIbmPVLDXTQ/nx0hYcUBZRzEE3R0
	3RO7HJoVUpFHPexC/tbCq4th63QVy2RBaqEOe++Q8aZKgRJO4Ub+maid1AkOFeyiCcQ2Yk+
	Ntb/euEYQ3YCarhn1EannJ/cwTzaw4bCuchYdWVGwO+jL9j0KIuRnkb4iN4bzJbvO3obz67
	xysJQaMAk6SzkDfZCsEc2jilEhIkROLSGzu4ceuS0UFhJO+UAP1W+Li9OzskHI7ic1TH7WQ
	U5jwtNc4U5385fhVFGl7enuBuIkxddf/b8XrJEAMpd5ZTfMWcLsLEI0KteMydAhrT4W+uyA
	CAO7HzMeAWyC5mthzUuAOEyF8941ZRuexyPZzmL/evbAiz1miuGSE4NOa62ORg4dxFsvhqA
	0j6tX5xCEFnG7WwPZR/J0Uf3D0716gnwCgwvfwW5i7kPn4MyiDYy0auTQCE4ajZQXXnFFJC
	8LSn+SIE60p+vvL11NGpcTWH8+tf4=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Mon, Jul 21, 2025 at 02:15:38PM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2025 14:02, Nick Li wrote:
> > On Mon, Jul 21, 2025 at 12:48:24PM +0200, Krzysztof Kozlowski wrote:
> >> On 21/07/2025 12:38, Nick wrote:
> >>> +  firmware-name:
> >>> +    maxItems: 1
> >>> +    description: |
> >>> +      The firmware(*.bin) contains:
> >>> +      a. Register initialization settings
> >>> +      b. DSP effect parameters
> >>> +      c. Multi-scene sound effect configurations(optional)
> >>> +      It's gernerated by FourSemi's tuning tool.
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - '#sound-dai-cells'
> >>> +  - reset-gpios
> >>> +  - firmware-name
> >>
> >>
> >> I do not see how you resolved my comment from v1 or v2. Nothing in the
> >> changelog explains that either.
> > 
> > Change logs are in the cover letter:
> 
> 
> And as I said I do not see resolution of my comment.
> 
> If you reject reviewers comment, usually it should be mentioned in the
> changelog.

Understood.

> 
> Otherwise you get now the same review as v1 or v2. Devices cannot work
> without power.

OK.
We will add the supplies into section[required] for the solution.

Thanks.

Best regards,
Nick

> 
> Best regards,
> Krzysztof
> 
