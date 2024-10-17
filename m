Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09131DA0E3;
	Thu, 17 Oct 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167841; cv=none; b=Mm/FvopmYQ3xcNrquug0RnZ0L+AQEKoIreUH9lE70GHaNdsmh4R3RneSRR89bCesxdr0BmQTbdBeLKfTGtQTgrHgf5/1j+c3ED9+XctzWXOHe/c7iK0SZIaUgNAtPCWkpoUEjqdapsr+CNahkNnJuv4mHInFzU41DMWbIY3qYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167841; c=relaxed/simple;
	bh=bHvNg6lEoyLApODpXNCcbT9lm9EykEZEe35ODNTzObc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIzZp9i7kSGUAw2E51GEX2mYXrgVkwfvm5RgdxkPnjYnpR8ea2e6Q7IP5G/GgzRREG4ytUZ3Wyo3MzBe9j5aZcl1MoClThGag6emSvDgS39uhbUmYa4PhQI0B94alTkGmgCpYJdlH5Ct5I7dj69+6CFA94H33Ng7ZalIlfFDzR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XclNNxU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XclNNxU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF033C4CEC3;
	Thu, 17 Oct 2024 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729167840;
	bh=bHvNg6lEoyLApODpXNCcbT9lm9EykEZEe35ODNTzObc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XclNNxU7skSrZbtpRvAEMhCkNAuR/UWwiud4BoO5zyMBuaLb/2UEiuI3Q1zfQ2THF
	 pLoeccckUjaAzG3OQMKiLDU4tNDoa5iEcutr/H8JeNOU3HeQP1x6UREzBwe7gkP9g4
	 JqM2zjjrBFNyKHYDIp0af8059Zvd5QpMWu/LQZFMfpBR5L9m1pkMLerPG7lYC4TeC9
	 OvRVt9xWBvfHmnAhV3Wimi51vVPOhw13FbVN5TNM1s1foeHrA2Oh8P1YzcD2x5rQjf
	 vwIlo9Exf+Ul4ccYTvE5OMSVmxD8kCxJz96l0owySCf/Pun58V90RyhO52RKiiEmIF
	 Day+2C21BL/wQ==
Date: Thu, 17 Oct 2024 17:53:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: Re: [PATCH 01/11] soundwire: sdw_intel: include linux/acpi.h
Message-ID: <ZxEB3FcHebxReB+g@vaman>
References: <20241016102333.294448-1-yung-chuan.liao@linux.intel.com>
 <20241016102333.294448-2-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016102333.294448-2-yung-chuan.liao@linux.intel.com>

On 16-10-24, 18:23, Bard Liao wrote:
> For the acpi_handle stuff.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
