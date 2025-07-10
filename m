Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3800293B55
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139584; cv=none; b=el1mjrTyDIz3YCeuaa0y8urwsZ7/eCpwDl6iynDTAFm44m6zPpkqrvGAJvggFh/VuKzbad9/l3/jjT7+p6j0oq85MCFx6aYST+1xOgTpGsXWBvoN5IzMDoPqCbvPNfmwFV/uo7ij995q2BhH3+2Uj6GiIpCBhOjde+bfRc1ONaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139584; c=relaxed/simple;
	bh=h+I4PESBExTwFLSyj1x6avtCbIxfti7hBaT17gq0P4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rv6QDkLwWnz5Z3ujHGOdCzH8TgwaJb5M2t80M3zHNdqnO1sEFOTia5rPPvJzyhDjaStwDQmpufjHO+PYukomrf4JF7hb/0rQLq/naL2q5pgTJZ+ycaiXlsd3zHFiAc7f870Zf0ddolJAwkrzZgf4uR7IHi+iSjP4wIUwF9COp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpsz10t1752139574t2e477d4c
X-QQ-Originating-IP: fVANaU33qzx/j+OxAgI6zbPV9xjAYtm3YAX+hwq3ekA=
Received: from localhost ( [183.17.231.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 17:26:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13541076069648255284
EX-QQ-RecipientCnt: 14
Date: Thu, 10 Jul 2025 17:26:12 +0800
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
Message-ID: <BCEA350532C6759B+aG-HNOXmswyEHs2v@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250708112901.25228-1-nick.li@foursemi.com>
 <20250708112901.25228-3-nick.li@foursemi.com>
 <20250709-invisible-frigatebird-of-felicity-7e87c4@krzk-bin>
 <BD2D8A14FDC941B8+aG91lowfru0KiWWW@foursemi.com>
 <3bb34074-8ce0-4f0e-b7c7-1d77a8cd6ea3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3bb34074-8ce0-4f0e-b7c7-1d77a8cd6ea3@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MdFqa/F+leU8tAGDvOf+cHYVbbApKTh4Kl5qKqXMhJ/owP2UP+sp23JV
	T6GitywLgwgaNOrSTIr4l7rERg2ncxqKq2FzRcvzgJA3gs0qrZF6BsuFg/0HiTm427KBG3V
	zKMSouKR8RBHRS5DZBK1mO7ib1dXes7nF3uQPH8jw1XeabIOSQCNucMvgCFj1FTQcE/uneD
	tWrl4d20xayJEZ61BhBZgBBmtqR4lJjJK0HLNx9J27/uxxxI765FaZCt013ugcy43CD7I/M
	CDmNqC0qmH72KsMb8FAdEQhSlNgjrrlUZU8NQCcGAWjqRwSqDkpyjNyBncpYKeZv1odMh3Y
	Qzo2LDDfqVMqoORSGRiT0whViXKKsQp0S2Qlb6af9HCVBUBUmL180qkqSWOydQG9Ia+LljC
	rygG9SyM4Cg7qjq5isw0YndYcVi+2c+cx8HuaHQH+WxwZh/CljO2CuA8IpEz9ReUnusJQRN
	iRYYwpfdD8sz5mzG2hxmOwEGTNNEdL0twfMzBa0NqvG2MNWAiuBuL7+ghHuWH8JuVkiZFo8
	83rSIAl7eGNYf8pionlc/NtpNEQvRA7lHQqIuK4CuVU/gWRsUAfWX/9JvWKyJ7DyWV1ZO7F
	tX34imiKi9LlIKtK0hXLHA4DBaH76GdOI2PkaY7D1qr4HmYTvZ0KJs19T/oeXm574hw+eSj
	WivkJlHXkr48BXIMm5oadEclGAUx1mbLrr7Y97UGKHgmPh6Vu5xGVaDRJa70UtCwTEQHMJi
	M10tlJs3UVDPoPUALoU5IWhdcIdZepvMfCUsMoKFSrFCGHJa5zXjYNvBzVHapxuLQJeyhtc
	k8ooUFRy1u8id/Lhbvj3BN7X5hihNY44WpEbqE2zWaXnHGl8AxoT3+xmCzJ5TXsCvzclJ26
	R9LE91A2J66Do4qPZMUyJxQgmm0zyDkgtNY/XJhych0znem6aSpSvB/QkYh6/7WSploQCkX
	8CXn+ZR5RIY3cnc5Srg41mOsqZJb/oLwl+4g1H7h5/opYWJthNf/uPCRZhTXauNWbtulAij
	nyyae/3B0SwTR56ymWyibu3wWYi6tb8bx87mp/2xozNFv3aLLRSCn9t+eBcYvOUZYzkVpZB
	OtsrE6Bf3GH
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Thu, Jul 10, 2025 at 10:27:59AM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 10:11, Nick Li wrote:
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - reset-gpios
> >>> +  - firmware-name
> >>> +  - '#sound-dai-cells'
> >>
> >> Keep the same order as in list of properties. OTOH, missing supplies.
> > 
> > OK, we will fix the order, but the supplies may not be used as regulator,
> 
> Hm? What does it mean in terms of hardware?
> 
> > we mark them as required, is it OK?
> 
> How codec driver can work without power?

The power may be connected to the baterry/adapter directly,
it may not be under the control of the software,
in this case, the supplies are use as dummy regulators?

Best regards,
Nick

> 
> 
> Best regards,
> Krzysztof
> 
