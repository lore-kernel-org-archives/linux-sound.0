Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952A01632D7;
	Tue, 22 Apr 2025 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287993; cv=none; b=cii7buI/fp8DzcmmuYD981m3tip0XL5VFI0if6wF83nzejDGFo4gPBjGdB8A4FDKq1QHDMPrnDGDN2d49HH4E3fbe5idG3DALloUnAmIQ1o6ZW38npazRI45qkdsPfw71K8oAM+cluHl/NTGULhTgNVcJVwhyEXDgzLeJugALso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287993; c=relaxed/simple;
	bh=ZpRIpH/Xb8Bb2a4xbOALqDTv6V3r2LMrpwZauHQAsHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ii44D4FwU0GR69iUvFr/YvGauDf8Vsr5bG8UIXeRcuEkrluJkC4qgq1rvi7IPn35JccpNUIRAD4wQEgrlBQnY85YgBd0JvDz9GuvNwpdhGUS79OAwBkXOwWgzoRsYKvnBW5G1jvQmc0gQH2QCwjnTY5XMtVN6fSXMgXOv7m5fog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=j3c2wA8t; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="j3c2wA8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=s2WKQWHFaOBBiVhKURZdk+x4emLXSSQ2B7MB5TSOXFg=;
	b=j3c2wA8tiUnKXr/gWCGn17+9XdyDs9/XezbctZh6IUY1WMWRw6YRIOqXdWz4AA
	cdYQ3/JR+e09qDaGZwZNWc6EyJYWnWbbGYH3iSMPV40qJW20oAKpUWig3ue1BwQa
	sp6sfl82ySFFPS5L/XB9DKkwtQbZqf1wbzk+uk3hNm2OM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3Mz4L+wZozti7Aw--.12946S3;
	Tue, 22 Apr 2025 10:12:28 +0800 (CST)
Date: Tue, 22 Apr 2025 10:12:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Message-ID: <aAb7CkrxVmTtsTHg@dragon>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
 <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgB3Mz4L+wZozti7Aw--.12946S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI75rUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA2dA2gG+w3pyAAA3e

On Tue, Mar 11, 2025 at 12:32:55PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add imx95 DTS for SOF usage.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!

