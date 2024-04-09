Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1412F5A7
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668075; cv=none; b=TbIh8t5wCL2HyXrIq4iApVmEjYBQxJdsMI0khgZEnytlX3oMqvUyb0MTygcsjIt6vWHF+aTexy8wUrLSEIpX8FomlEiLSm5PEX8rilnpcd5pWwZq/0oz00W8fypWnKhcGvuNPvmavuGQE4dWU/Bd+GT6//kuOqqZO5aTYnEcSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668075; c=relaxed/simple;
	bh=efQW4n4+VTeV6F+TzLQ/Ws25y4//427fEzcwv/kchgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ro5HuMCAt56+qgpOLNsoUjvIVMk6hrvM/15Tq2HuXj43KROm381quMdj96yGBV4HFSjiMcMNUqf9XXQ0N/up7LGyZgr1RIXA3w8Tx/wqQs8ZtzKwmwpJgZWXWzu+Q/i1rGEze1qrWu6IyQRZ69MrnL2QyJOj2PkWrUerrIstfUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYRyRNhd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYRyRNhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FE6C433C7;
	Tue,  9 Apr 2024 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668075;
	bh=efQW4n4+VTeV6F+TzLQ/Ws25y4//427fEzcwv/kchgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XYRyRNhdEF2x1ljcqMNm4wvZ6bUaA88jFdFP5nsaWcvpxa8vQrUW+W3TYFqFJQH4s
	 gif8mbrpvlGPzjfBzJ+fkSmXmZL9i8vCybiVHNAFACpT5kS6Tkp3jJbVl0rFnW6Pr0
	 5/rFbWCpmuoa2F1INpDbg8pKri/nYXGEZlt/8xYtDcIieIWaVc5tuyy/Y0V/A4rdPs
	 SlVWgU0xI/LtwPNuZXAmU+fyQ0WUoce1pXSw9SEGqHl81cJ1parm7D+s/zIIfIgXFS
	 72cbsGpR5Y4zPo67bkqZY9p0v6RYCzXD+VHgNrNKds6bPvh4pZEhLRIdK+cI/U3ecz
	 TIIQuEcs6bqBA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 hdegoede@redhat.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20240408081840.1319431-1-cezary.rojewski@intel.com>
References: <20240408081840.1319431-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix debug window description
Message-Id: <171266807341.28088.11267755974349863620.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 14:07:53 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Mon, 08 Apr 2024 10:18:40 +0200, Cezary Rojewski wrote:
> Recent changes addressed PAGE_SIZE ambiguity in 2/3 locations for struct
> avs_icl_memwnd2. The unaddressed one causes build errors when
> PAGE_SIZE != SZ_4K.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix debug window description
      commit: 7a1625c1711b526a77cb9c3acc15dbba71896a40

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

