Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4EC1F936;
	Wed, 24 Dec 2025 05:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553583; cv=none; b=U6bJTSYALwxyxCmSbhGN+FjC7XMn65t/f724AGCUcMh4fZroGLXHHrdrQGRdlhdL2C13YX6s4yapbC0tMY7oLMvfDqqot2aAzQOIbhe4LgvIUvSlgvYu3/zYOb067YGO7/N/lOdCIznIJG3tY9oE2MuNlNWhhX6PF6EDm1bFqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553583; c=relaxed/simple;
	bh=oaIzG61YO346lvrJ+E6WZfpa0Ib/7fIMxliygY80izQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IRLEhmP8W0URjMc+rSurKEGNrjFBVbC4KmClB6EcFzzS+mdCWgjlhSdlHKY8i4dg4M6DiiPxdeBRji7hKVatRrT2m8QOk3OLwQIVpIU0DqeZMC1sSE15XMstPo+18/uIqHQPmcgRWlGEZTOS1mKDuGJ4IiqUcDNK7kzrqgZy3CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwWsbhh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwWsbhh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE61CC4CEFB;
	Wed, 24 Dec 2025 05:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766553582;
	bh=oaIzG61YO346lvrJ+E6WZfpa0Ib/7fIMxliygY80izQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jwWsbhh4Z4+aO8pDw8jPSAv4NyXCPde76TJILszyUTh66MnUxrl3kAe5I2XQbtz0r
	 CCYLpdw30QYFJ/CyxgIKhB/OPFh/I44nddWzBDaDfzSmg3/xzlilRJEl+JJ86Rx9Gd
	 au4bhMWcuinWjiKWtlAWBt0yn5k5TN00q2/cxCKUk0vkaWGujJ91ySyN9vo7zfkivk
	 D7oQZRYoIeH8YLRElhEkiuyeUJolyGS9dpuE+9CDvRHzeSAtIsdy4rdN2oF1AzL/ZX
	 QaTbhIgMp+nedT0dYHMV2CLIwTNdClxN19pXvAWfERtUkDLzPp8t7HHQf8Q41gPziK
	 n9Tkz6qzKJYvw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Rander Wang <rander.wang@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Liam Girdwood <liam.r.girdwood@intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251223215014.534756-1-arnd@kernel.org>
References: <20251223215014.534756-1-arnd@kernel.org>
Subject: Re: [PATCH] soundwire: intel_ace2x: add SND_HDA_CORE dependency
Message-Id: <176655357953.792216.8437808469032273609.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 10:49:39 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 23 Dec 2025 22:50:01 +0100, Arnd Bergmann wrote:
> The ace2x driver can optionally use the HDA infrastructure, but can still
> build without that. However, with SND_HDA_CORE=m and SND_HDA_ALIGNED_MMIO=y,
> it fails to link as built-in:
> 
> aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_shim_wake':
> intel_ace2x.c:(.text+0x2518): undefined reference to `snd_hdac_aligned_read'
> aarch64-linux-ld: intel_ace2x.c:(.text+0x25d4): undefined reference to `snd_hdac_aligned_read'
> aarch64-linux-ld: intel_ace2x.c:(.text+0x268c): undefined reference to `snd_hdac_aligned_write'
> 
> [...]

Applied, thanks!

[1/1] soundwire: intel_ace2x: add SND_HDA_CORE dependency
      commit: dddbe80536f3676b9b14a034058c81a1798fe374

Best regards,
-- 
~Vinod


