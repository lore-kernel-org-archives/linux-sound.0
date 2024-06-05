Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988251607B5
	for <linux-sound@vger.kernel.org>; Wed,  5 Jun 2024 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717623501; cv=none; b=DbiW06orrRkmHX0lLKoaDTz3b6eAxxNaBmCrqszzsWGXYo+GSxeZBiB8pZjbyDInSU7QbQKe44MNxU1AHsS9qGxKhVqZwsbuQ9T1Ts8DkSgxwZyUmnzlZf7DNfE2YJcGjmIr0wN7u2juPnw9nxiWfjGlRELz8qBuKDqzvFMN6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717623501; c=relaxed/simple;
	bh=oqvQR4sWIalJUxwdWmfXyKhOgxcmf7fGnTTdAM36bQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gZDXbF7RRqTTd3/afnisq6h700xT17aW3DJIgZ0h2SxeP8cvAE9BAXQX6YCw7Sd6ZWyXEdBbjIDkuqOqqqyHZzkGLOoKHnNdmJPjA62EBJLhJFY4dL+rewNnn25N6d0on+e/XyP+sZRy7+QM3eYlZpUCHMKgVtlvHgURRCndjyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhHJEzgL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhHJEzgL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA494C2BD11;
	Wed,  5 Jun 2024 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623501;
	bh=oqvQR4sWIalJUxwdWmfXyKhOgxcmf7fGnTTdAM36bQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UhHJEzgLSwatEYWrAMtDeR8p+2khQ+aMBsbn91CAWwssE81sRvpGnhkXwruIpmc8N
	 ryelAFRJixdCyopnC8CX81tZrCnjYUyGn6R21XCAcNfO5fNFS+UXvZgrxTQ1mUn98o
	 JqbJ0hxNzNlmKsSF//HIKaZory5JzC9WiUy1yEcDiD9o9qB9vr8FV54P5Rn0R1tIh8
	 IWnUb5JLKviSYGRXdFGDEy/he5EhJ4vMQbWCzJO8TNYBLgLWQlTAZqmrvfH55SYO0y
	 NVpy6l9wml0F8FBrXwAHObv+eu26lNwkMX35hTT769smwUTBySrEUPoNzEtdDNA96i
	 Yo62RJrLprIMQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240603072544.5215-1-peter.ujfalusi@linux.intel.com>
References: <20240603072544.5215-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: Align ADL-N sof_dev_desc
 struct name to convention
Message-Id: <171762349962.565712.7589749713938858229.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 03 Jun 2024 10:25:44 +0300, Peter Ujfalusi wrote:
> Follow the convention already in use by other platforms on naming the
> sof_dev_desc struct by dropping the underscore between adl and n
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-tgl: Align ADL-N sof_dev_desc struct name to convention
      commit: ccdc13ab26ca248fdc53179a0c7f588ab2e1c8d8

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

