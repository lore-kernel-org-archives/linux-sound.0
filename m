Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DA192B6D;
	Mon, 23 Dec 2024 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945138; cv=none; b=InDTPMz9aXm0t8Dr1WUfcCiO9mAyZq4BeW6E0xzY5g6wc/hLgziHUHsCYa79oQ/t6zBT5qwqRQ47hQyeal5+E2IIE00EIFTClfARLN/N8qFU87XD8BSzF3hHewLRkmIeb2ags7KXs10g8iCocXskaWqMEIf4Hj+LE1lbpAXGKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945138; c=relaxed/simple;
	bh=cgVu56YmWK+1WaF5o+4jK4YzzBBIilgf1IvFnZJzKT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MjXmjaS/SNIuai5o723eDCp/GHaeMFdQ+1XNrOH1vhjgCU95xdONoN4+0TtVUBhUUYbYJc9i0jzevUqIJx4aiU3AQV9rDYQJPB5m2S0wpZme8hdhccpyvxlsmMrqU7KdOagzd26N9m1suLj0wc9fU1PkLmbaaxFI1TAMbF/7Uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gN13Omkj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gN13Omkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F37C4CED4;
	Mon, 23 Dec 2024 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734945137;
	bh=cgVu56YmWK+1WaF5o+4jK4YzzBBIilgf1IvFnZJzKT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gN13OmkjyqmFgRFpxmemUHuNbmylgiKIpZFIFR3+LcizYE9EZMFsBxuyAZGzpGtvD
	 WwklWiJ3/UPLFbMVrWn6WAK4NaZ02s73c35C1qVFGkCZucfBq1NmBEyEzCaZVYHmyk
	 aM74zxt2CZ9LGj5dERtUMAdjo1AcmUignm86bOS+HuLsC13ubAgaKtEJNE3M/LPUWo
	 U92qefbJpjzbgvQIDUh7uKHeoaCJtetahvWHdCGUUvBPjd+D2CvpJYFE3FvMDCega4
	 aPefIfl5o9iuz9vYfPzE4jGgLwkkD7OTet/BxTx8bUZh2RSAOzH3XHX/cK506o7nvp
	 WbmVvM2xudd5Q==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20241205113315.2266313-1-ckeepax@opensource.cirrus.com>
References: <20241205113315.2266313-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: bus: Move irq mapping cleanup into devres
Message-Id: <173494513533.830310.5194901557123333076.b4-ty@kernel.org>
Date: Mon, 23 Dec 2024 14:42:15 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 05 Dec 2024 11:33:15 +0000, Charles Keepax wrote:
> Currently the IRQ mapping is disposed off in sdw_drv_remove(), however
> if the SoundWire device uses devres this can run before the actual device
> clean up, potentially clearing the mapping whilst it is still in use.
> Make this devres safe by also moving the sdw_irq_dispose_mapping into
> devres.
> 
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus: Move irq mapping cleanup into devres
      commit: a5fef9baa87f8be359a4b3ed11829ebca82e56ad

Best regards,
-- 
~Vinod


