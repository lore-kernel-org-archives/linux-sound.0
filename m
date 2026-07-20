Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E63BED5C;
	Mon, 20 Jul 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581670; cv=none; b=UokChcxGSQ+VG0KvhPR7MfyQjbq4MdHkmBjLPqzaoXx1X5dZIxLSJlENQf2ogHlaHm1UI1nVX7vjWwyXo07FC1ZTRULeBEcMfjdT5D648xGhbJ34UbwzLydAi7/x8/WnFRMUUn8xFoTqJc4QhIpjXTfl/gY7ALK2ijCYHw++c7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581670; c=relaxed/simple;
	bh=kC1poXNGRS9Hc2GECcYMuxI/ifWPepG/y9m7GgtgbxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGbcMrEVcNIPG9MJVDSWgns9qBkpga1py8xRLmampv28+BGSpM0Eo/v973MIywLy6ExXpZRVJRhJdWRlVLPrVNOdwFbfLauQGUVPG4qGQ5MrxKptD6lmZB05TabLFK18yOYUv4OnUbJ/jWhglX5qQLl3L6rpDnppVvsJCYwlwzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhF4Fc/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhF4Fc/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4A71F000E9;
	Mon, 20 Jul 2026 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784581669;
	bh=O/TESj36xYtHVmhGVZRUJ9VB5vS6G/Kju+XMQRCUDKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RhF4Fc/iQ/btjPHKngm7z41JYGFPJubOsSt5zPhz7olJ1GUgoUWrk+rIKLDAy2KSq
	 ZRrYLJU191/DwIBeUSc0mVe4vndg2VmL2l/89EzzMZ+S/YvTBfQtN5RXH0qOpwTxM9
	 rKs04Rzk/OguD0i4LusBU+dG+Ih0tnmHaUdRzRFM7vpeR4r+jDHT6hFWfPEhmkjP/H
	 uxFWLGVmNEdajingyCsBG9WqeOvKuPrjmqpGSLm85J8ZK7jjWRwmmjyPYOOgiqMmNJ
	 84ugdaxiAPmYzCy6B0rLxUCvNA2H/0drGXTX5j1iAQO6ezgsQ+PLbG4UUpbZ1gkEDs
	 HPRRXMo2Tr9Xw==
Date: Mon, 20 Jul 2026 16:07:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, m-chawdhry@ti.com,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	goledhruva@gmail.com, daniel.baluta@gmail.com, simona.toaca@nxp.com,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema
Message-ID: <178458166840.4090814.5526511707864196860.robh@kernel.org>
References: <20260713-ti-omap4-dmic-v1-1-3cc6e13decec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-ti-omap4-dmic-v1-1-3cc6e13decec@gmail.com>


On Mon, 13 Jul 2026 18:17:11 +0530, Bhargav Joshi wrote:
> Convert the TI OMAP4+ dmic bindings from txt to DT schema.
> 
> Following changes are introduced during converson:
>   - Drop ti,hwmods property as it is not needed since the sysc
>     conversion no existing DTS uses it.
>   - Add dma, dma-names, reg-names properties to match the DTS.
>   - Update example node to match existing DTS.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/sound/omap-dmic.txt        | 20 --------
>  .../devicetree/bindings/sound/ti,omap4-dmic.yaml   | 58 ++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

