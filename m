Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1633F8D9;
	Tue,  7 Jul 2026 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446560; cv=none; b=dzykZaUxiu6QHL7aFMuLQOjYMorBKUSlAfK4e6j6RrS4Stk9AvCTRIG1hGXu/nO9sKx+edNhIF1FMRzYMI7qBC90v1P3S2APliBIz8PylDoYgnjx93Vr+OD8L2kuW/Tp1y3QunwcwPC9vvf77zGBYO0ViHbogIKNFSfEChZcRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446560; c=relaxed/simple;
	bh=y1EbW524xeK96hTgUykTfbwl+Epc9aUPDMeJeNuPUb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuSYmLnACZHgr4863wl2J30cHbfj1mEkovIb5A9uNkopCPUh3H0r0pLW7l6A1NmbaPOaa3yYiQKZJEkCLDj41s6I/WBiwWJsRElOGc50DsTXUKF3cb3eQf320+hKm1gpq0M6EdI14Y4ZTESEaYn8u8BTfsTsgUpyw+7ND3XYHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwMUeCoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwMUeCoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321571F00A3A;
	Tue,  7 Jul 2026 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783446559;
	bh=h1FTRL+xnjk0AYFB/pvxSRsA2pAcCx47vH0N3sV3wus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KwMUeCoGpqIwVV7wzTpHZmToO8iyWPJxkJWhzDqxzMVK3qdUULlm0O2lpxFbrPTxW
	 +YZz43nueTqUphAIv0LG/MhnXc12S/seFObgXDdYLRevESUpRATZjA1qBgRS8eUYgH
	 8e293lcc7V3NNsJ7Bo4V1fVcDQxIJdhL35ELnjrdbplOTqIojAhna35LqW7McNUGNr
	 gKtU9zK5MPiLMa5Yvo/+evxmeMruQ9K5fkwCOj5trq/8y02eYwj85MWBFqHH/VZCS0
	 FJ8OERXr8A8mlRgkDzaKtT+yKTEbUOYv+QC5A0LRAtG+tqpDXrhh4RppkIlyE7w945
	 MA/fOXek6FpSw==
Message-ID: <1ec22d6a-043b-4e10-956a-866d8d431011@kernel.org>
Date: Tue, 7 Jul 2026 12:49:17 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: amd: ps: bug fixes for ACP PCI driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 syed.sabakareem@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/26 00:59, Vijendar Mukunda wrote:
> This series contains three bug fixes for the AMD common ACP PCI driver
> (pci-ps.c) covering ACP6.3, ACP7.0, ACP7.1 and ACP7.2 platforms.
> 
> Vijendar Mukunda (3):
>    ASoC: amd: ps: disable MSI on resume in ACP PCI driver
>    ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
>    ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check
> 
>   sound/soc/amd/ps/pci-ps.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
