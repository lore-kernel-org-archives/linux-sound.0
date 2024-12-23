Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840FD192D98;
	Mon, 23 Dec 2024 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945140; cv=none; b=WZl9pLWd/4K1bFvjz4z/L88oEC/DJCWb7PkPeHamovHYtJjts9fXVX32I6v0iBeWK7TDEPqp0kkMOkqWWIODlEQQ958vUIfFyA8kil4LWrWdGZ0XAmcj8Ie2QRAjD92u5Q8yx0rHdA5OIvDTuQ0sZ8/EIvElnZ9lU4c3FZ0gJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945140; c=relaxed/simple;
	bh=M29wXc5eYIrjSeZ6gPYPykUtm3ossZxJBABPhruyPbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jDuhT6ieD0zcYlmnDW071HtFZHUX1+iSuMpMNaUZtna9+/5qbil1n6US/Hskvufu7+Kyt4dSGDVTSM1L9fHdbJKg5fhF8Fk0D3QVG5u8zot7rxe5KiJgSeGrzg76iM/wRYN2K4Sh7mgzjkQ3bDiTXMIRyUGafS0pHuBAHUUr/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/65/38Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/65/38Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68446C4CED3;
	Mon, 23 Dec 2024 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734945140;
	bh=M29wXc5eYIrjSeZ6gPYPykUtm3ossZxJBABPhruyPbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o/65/38YwRMFx7C48ggkc+29tHrPLmwTMpr/PP4cMYB6ewrluIlNflRi62j+O3TrW
	 rfe54JgBPicPf7w7a+YvY5g3HmQrCVie+mG+hac0EhlU8jnotx2lwmcNavQg+kOQi4
	 H1BItJwBZq6idrwni2kB+2hr4JDCDp228OhfhxgJi0PyQiS/bK0A5ikW4GDc9lynwO
	 ufzV1CKkdCQOYue7mk5UqQX25SfVvxfWhh0rvlXX2ljJJAsnLo6nmjICr1N/FUkEfA
	 RPzrIy8V/oqmq2vXbbfRBZL+yBdyqAxu0wEHMR5r3jAuWaQ5PDvyauFQFnw1nv7Cnz
	 5MGi3f/j1ML3A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v3 00/14] soundwire: add multi-lane support
Message-Id: <173494513806.830310.15574504112135989168.b4-ty@kernel.org>
Date: Mon, 23 Dec 2024 14:42:18 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 18 Dec 2024 16:01:41 +0800, Bard Liao wrote:
> This series adds multi-lane support for SoundWire. We will get the lane
> connection information from ACPI and use multiple lanes if the bandwidth
> is not enough.
> 
> v2:
>  - add 2 commits to fix the issue of starting streams simultaneously
> v3:
>  - Preventing accessing the non-exist codecs in the "program
>    BUSCLOCK_SCALE" commit.
> 
> [...]

Applied, thanks!

[01/14] soundwire: add lane field in sdw_port_runtime
        commit: 6bba2d3f744c4383b22aa79471d7136cfdce7d0c
[02/14] soundwire: mipi_disco: read lane mapping properties from ACPI
        commit: 7533d0df69452c3e7b69c727c1e8e1a7e1afc83c
[03/14] soundwire: add lane_used_bandwidth in struct sdw_bus
        commit: b6a2e1be7d9303d07eff72a13132a37e035fbcfa
[04/14] soundwire: stream: set DEPREPARED state earlier
        commit: f1b3dba6905a9afc49996b039042c411aa98fd52
[05/14] soundwire: generic_bandwidth_allocation: skip DEPREPARED streams
        commit: fdd1faeeec14291f9e542afa5ccec2c5a0930f5b
[06/14] Soundwire: add sdw_slave_get_scale_index helper
        commit: 8f4e3343eda8cdedaf711bf3d8ef2d6ed571f420
[07/14] Soundwire: stream: program BUSCLOCK_SCALE
        commit: 645291cfe5e52cce9571d73542476bec1d79ce26
[08/14] Soundwire: generic_bandwidth_allocation: set frame shape on fly
        commit: 3ddd303f4725b66d418998ca21cddbe9f31bb8aa
[09/14] soundwire: generic_bandwidth_allocation: correct clk_freq check in sdw_select_row_col
        commit: cf44ae3d3282572480d760199cc8d6c7c61006cf
[10/14] soundwire: generic_bandwidth_allocation: check required freq accurately
        commit: 4a7927d54d2c819029e70f6efa768085b90bfc34
[11/14] soundwire: generic_bandwidth_allocation: select data lane
        commit: 7a30292ffa2a048271755fdf9364e11343315271
[12/14] soundwire: generic_bandwidth_allocation: add lane in sdw_group_params
        commit: 366fd59fb894e3d3605de9eeb856e92221ff9d48
[13/14] SoundWire: pass stream to compute_params()
        commit: 168cdf9cdef232225f6b6c617fd347b4d1c4a7d7
[14/14] soundwire: generic_bandwidth_allocation: count the bandwidth of active streams only
        commit: 25befdf32aa407ac21d8b2aa1257ff666fb783b2

Best regards,
-- 
~Vinod


