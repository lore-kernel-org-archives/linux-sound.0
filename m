Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529538AC83;
	Wed, 29 Apr 2026 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450000; cv=none; b=P9eUwHga8yZuLj5kVamwZwl1BGtAqJoyhqzGUjU7KG6f2T2DjznKbWnYaAoWFnXiDpB1vaKgwxCxi4nCPLrswIy7dpMgpwLDWksPMg6JiIYQoM33CrVW3fv5IifVI5sUacUs0cuBE6zFWo2ocvFYF2yt/iZUc771srE55o8lnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450000; c=relaxed/simple;
	bh=VVYnj1NTnND102+Nf5YuvXZE1Q7Pxxugvsqk0sklmCc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hxh6Oh1b6jiNFRw3Bz+gAXEgnJKLZq1nOLDMjfR7XpV/Uvk1W2qhTcDvq3GkUkZpVu97HHGcL+X1VcnAutylAjCfOy9o9SGsIHV0wh75Z2Z1FsVuSz/wgpvJqMckIRtmZ96CkuigXjY/l1VapMr7z6WsMYdvPKrOFG2EsP3DPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Pupt700R; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Pupt700R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449996;
	bh=syEXayrqEHH29YbUaaMKUuDyp4pncudJ2CvPpGtXRfE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=Pupt700REialrguCPvpqNzAf65wEHclICw8FbyEX7TtFrbRuN+hjQ70F6/sjK6dPX
	 L4dXfRwgmySHdDpviIhNB1s7wqlpUWSTlBEOVAOnbnjPc6ly7hpeqGzL0OdfJl+pkb
	 ZNq8O0YRWyCzVPoZwlKPEGaIzt+8Mnq7GMgAPz9U=
X-QQ-mid: esmtpsz16t1777449991t0408f2f1
X-QQ-Originating-IP: zsMbRQkynHqJbH/L4Vq0BAqBfw14VUbJtUTjJQM+xnU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 16:06:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2472965661338442668
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 16:06:29 +0800
Message-Id: <DI5HFOQXG947.3NU2PDAFM2GYY@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property
 for SpacemiT K1/K3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
 <afFqgF6ZRwYdfUmL@sirena.co.uk>
In-Reply-To: <afFqgF6ZRwYdfUmL@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvjhxCSDgXICNTjF5sbhR1Ej1KS02YF/43sZoKoKRo1Wt/BFz3Eozs1g
	szIwzAQfrwcXlmGc/EivbdsQBLMg3NHxaQysIsJUMzbso2+j8TEhRq0HBkwyr0WNKD4+o0q
	s3TohujMd71h0sxQGLlwV0Vpj828JTF8zwvKc2vnXURXjGbs4BhCnPXEFgQLnaiGOYf/cyY
	Mc4n11PXb0ovHnvOd6snNJX/ol5cjCiZxIcbwozrEJtkPb0NYqXd5PwaIrOxO+cRQ//BS+s
	iJce7xvsIt2VZcPPZQs2rCMnRg1y95wTL4TTqO2prKJsVaxRge8OqaU6QkybaSzrH0UgZu9
	x9vjOTI1qN9apasI5md8rYiem7i4n/5aH3dVxLC7/nPflnM5FtmyVBD0zM3MfXrU4wAw4f8
	o4iemIo33jzu3p6+P6jd/KkepaHQvk2CS/nMjxJUQxDXqFDIe7EgLFfLirKDZdamCktsnqd
	t9/POJt/QCDP1U/7Y8DK5ouNFyVXsfDn597+ykXTjaaliNUQqs4hRzOnVE6d+Vg3HewuYxh
	zELL9RYki/w6ZUDgNEsbmxoxlB3vJQBwow+YmooznSUShkUFkwYHkWND/cB3HuqCc8JkX+S
	YdfhqySEaZDALLmwh+TEjfkkD05DbXnnOuKwhYMQQG39QeTHkg1//dSi45EhOEoO8kKy0Pl
	qWmzKeJo/mQ2Ho8Px387TJzk6NXoHSjjrUuNc0XdCx5s+LISSnaTmqnSDEkA4+LqRI5k/lp
	atnLMVgpaKg1yGYdtkmsC6jdzsWoW0MgAEEPqoznSriaj2xL94RSwSPpk6QyC2rUn5O7MbG
	gbHDcShTGuXq9vSSvf4nvRMzrNkqOVYZBc7wzpufsLEgxf0A2V0fGh6xWaQlqUweLOLc9Ol
	OzB1MwDDvih7QjOA+S9l9fGApaO915yevjo2Q+m6j2wzMsMffiKPhgqfipKSsqFDGw7bInz
	kUX0k88J3dHdf4yLrGBsKrPSyzHdWMoST4P/XOvDuEd9oCdi9Gip2Sr1/GrlQblmVgN0EXv
	2hYRvnNLWAuckhAnT7OE8qmMfe8O/xlX9erUilOCyl9njL8iIwYxUfRqpJJErc7SgTd+73Z
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:18 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:50AM +0800, Troy Mitchell wrote:
>> Add the optional spacemit,fixed-sample-rate property. When multiple I2S
>> controllers share a common bclk, this property constrains all
>> controllers to the same sample rate. This applies to both K1 and K3
>> SoCs and is only needed when two or more I2S controllers are active
>> simultaneously.
>
> This doesn't seem controller specific, it should be factored out into
> the core - the same issue will apply with any system sharing a BCLK.

Agreed, this isn't SpacemiT-specific. I'll drop the fixed-sample-rate
patches (5/7 and 6/7) from the K3 series to keep things moving, and
follow up with a separate series that addresses the shared BCLK
constraint at the core level.

                              - Troy
