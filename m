Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C939418A58;
	Thu,  6 Aug 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005574; cv=none; b=TIOdUJ4pmFU6lSTd/62uK65cUh0/8/Dm0psbu0KXp5qKApPzOzKZVUylqjPm/Oj7RLUUn5REG8IxQaxcN/Pl+2lSGf5BQsugTSrlq8F+8tQQr5++kflGfzU4VeVOEu4oe/+tvBAvjlewoazs/kXIbDaimdDO/WF0c58/lnoFJXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005574; c=relaxed/simple;
	bh=gGYSqZ1TED/8dcXLB+8M7bneZYTdOxNfRG8ZFh0oDXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UinOQR6LpEluYGwgkWx3RxKk2ad5iGjMdkPG8ZYN71OJrxr1k76EZN7bbwV1GRFfe6C/gZM2iCIDOCokHUdzp7rr7dfOh/tQro+udoNxTofR+qk2SJoPQgglzknTdP1SnIaGJ8sExnXM8wBL1OfNt8dbDmHXSGP3tUQm6zr5A6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxWuvysh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxWuvysh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1330B1F000E9;
	Thu,  6 Aug 2026 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005561;
	bh=g8aOup9UaGXNpsEXWJKTOXFV33R9jHOfeDPwJF5Z8Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PxWuvyshxnumjGfz5RStmpI6S2Ul5t2y3hy/OkQOuKK1ebDcmJNbgstOJ5PtaOMNd
	 DGfWpJvR+ekvHha+k+bsm8HCy0AEy6WlfF7/wXUsypc2Sr4QSd4KTYGZ32wrq75cjb
	 uppIL36DtwVA9F6xlsRjZgSggcpQXnUrkybFX5oun6B4lYh4w8EfRxAGp/J7onDKHy
	 LRLbSUzynt/TLEXupEq+TM1nKofMPWUvNEcTgzJSQSaWCFy5FHHAZSzq4r45lSzeWt
	 CdPHIraoiSmvfVVV5PtxCLJgqdR/z3HumwRvt8un62rx2Tgd/2QtnpFYQD3YPzqgHX
	 YEI4kZXD2qnpw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
References: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH RESEND 0/5] soundwire: add BRA properties
Message-Id: <178600555868.593040.5186528640760890916.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 14:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 28 Jul 2026 20:46:34 +0800, Bard Liao wrote:
> This series adds mipi-sdw-bra-mode-max-data-per-frame and
> mipi-sdw-bra-mode-block-alignment properties support and fixes the
> BRA_NumBytes[8] support in cadence_master driver.
> 
> Bard Liao (4):
>   soundwire: cadence_master: add BRA_NumBytes[8] support
>   soundwire: intel: handle Peripheral bra_block_alignment
>   soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
>   soundwire: intel_ace2x: handle the max_data_per_frame property
> 
> [...]

Applied, thanks!

[1/5] soundwire: cadence_master: add BRA_NumBytes[8] support
      commit: f74b58902532bf397cdb62049433b5b2a32ddcec
[2/5] soundwire: Add bra_block_alignment property support
      commit: c0840f8be5d59071096b8e6b42693a0d912b7cba
[3/5] soundwire: intel: handle Peripheral bra_block_alignment
      commit: 110956d5fecd136153ff7680c72ce5239d47dd4b
[4/5] soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
      commit: 5ccdf9ba597881ffac8fede9bac0ea097cb4c119
[5/5] soundwire: intel_ace2x: handle the max_data_per_frame property
      commit: 2a4127a4c5de80d56bfd61831a77cb203fe19b07

Best regards,
-- 
~Vinod


