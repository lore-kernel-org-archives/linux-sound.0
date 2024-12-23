Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C7192D98;
	Mon, 23 Dec 2024 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945144; cv=none; b=P6ZmMA6Q6LK0m5rKU/l/UG8u6RMU3LCS07mUqrjcIs5vIWSPbYYay6JOQR0E1U45nkUl8seUdMI01LscRiS/KhSk3rcUoYsSGLQ+Xj5WIoL8eHxm8OJrUL9NyYh7+8eHDui8llUcUEH99jI8gGSEpDF+RrsRxSqWJzM9UGalPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945144; c=relaxed/simple;
	bh=h9YGRNmTt8k/JhSMq7DzlnJWXJOQxvg7m1qXhlH+PKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gw8/DMw26jicy8+qVPITAhkBvSdaprTtoD7zQuu8q19SE4S1ewsH17yb4fEGhKrmVgT3xGMXNES9D0hb1stEVchM5MS1hcejnm5oljEmX6T1ykoLmWpwiKoxF3aC8wKPXES3SfhRc1s5X6NRd/kOEj0IFIKIlWRLTAGFdn7ptsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhFZfv6m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhFZfv6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B7BC4CED4;
	Mon, 23 Dec 2024 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734945143;
	bh=h9YGRNmTt8k/JhSMq7DzlnJWXJOQxvg7m1qXhlH+PKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GhFZfv6m5JwspC6e/Wp0S13HBTWlgYHpfBTKo+bbTfKCjZ/1W5LwqtrtdEhnYqfB/
	 nvRZh8WqgkJ1dtqOgLtAXYWUBRdkNW+gbIWSOMY+iDjBKTDG1CaI8Kr/+GRsNBS+v7
	 Y+uOX6v/Vx4MjR6TzyfAlT+SjcUc8VzWk6Gv8k9o4I/L+Y/npAPWUKL0yHXlW9LebS
	 UhKXxBCD+/cQ/b1acaVF3NzNmd2Y0iy5OdIoTFM5u6gT2i6iiU88J4c2wYGOUD1wC9
	 mMCy93D/kua5d2B3ITwhL3KdZdW7bfmrMCq9Fqns0Ce9x85WAnhKIw5ouk2RSiuN0h
	 nwyBu6q8jaW7A==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
References: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
 power off mode
Message-Id: <173494514030.830310.1951135316198778911.b4-ty@kernel.org>
Date: Mon, 23 Dec 2024 14:42:20 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 03 Dec 2024 14:51:44 +0530, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: clear wake enable register for power off mode
      commit: 74148bb59e2064b87eb1715d9eb109adccb75316

Best regards,
-- 
~Vinod


