Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59723314D06;
	Tue, 24 Mar 2026 19:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381469; cv=none; b=XuPUJw4bPuS9t20vXmzRnHx5pcEQR5lwocxbsKbEomZeLd+5uR0/Sw0RvNAsFFLUsFEvCqkCXRZHwdPrlHA9D4LJxtrw3BxfPL5AM9dk2siNO9Z+poOAhaqXK/uZlze77A7KjSqXHbqz63QhAjweG/gyV/w0csxcOWdfAILjFSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381469; c=relaxed/simple;
	bh=JyycGDKlcwlCVFicHWeSPzl3zLF1Adopjxi21d8Nsb4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TUYatRs4vnDl/+AF3pqZoM+DPin2CenCkmRmUuurqGhpHWgiFFAff+yioOwK64kVywO7UHKuueG2Gn30aGznoV6QQp0SJBffBGA98iNgZQH6E9YqQAVXqb70yCQkK1flbvr56HX8pNU+d96ONfE3XxULWfy/9sVcDxQi11ypBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+UDEkdg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+UDEkdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1DAC2BCB4;
	Tue, 24 Mar 2026 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381469;
	bh=JyycGDKlcwlCVFicHWeSPzl3zLF1Adopjxi21d8Nsb4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f+UDEkdg3dSNDUeIDWrfa75IQJuPZMW8nNtP2yTbbe28f1VvziNolhfzHqyNcFJt8
	 kusMoGJKDbGhOBxrBdC7dZLcsH1sCb9FgYGrNG8ZFbZcjhyMj6aVolqOvkRe9436s8
	 DfaF/0vFiEEq6MbD6m7jNhpDelx/LRT1z0eeUp2AMhnIwHkL846XWqv2j26cL6SG6d
	 eJv9GI92fsmURPXZSXzMue+xl0DByS7rOz91iN9l5FphPS9YlOCrEqhbiMj89ST9XR
	 JuFacL+nG7sQCukpnOEoLShSEJRfof/X7BUTzHSU14ImTRsFhBVX4i+hn7g8/t435Y
	 Q/JmJDq8EqQCg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260324041300.784-1-niranjan.hy@ti.com>
References: <20260324041300.784-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2] ASoC: sdw_utils: add vendor_id to
 asoc_sdw_codec_info
Message-Id: <177435824556.86944.4336802698035861071.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:17:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JyycGDKlcwlCVFicHWeSPzl3zLF1Adopjxi21d8Nsb4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumZ8OFzhd7a8yaLGxKDDA7XWw+zLxPPbWG4e
 mOpu2+7oZGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpmQAKCRAk1otyXVSH
 0N72B/4kcODIiZeA2kmzhxJ5ZbfZj9aJmyPDXlcK/V25TKFpjTiFoKmV6kZr55pQgE1B9AAx2yb
 IOAWaYm5wsQrt0QXEOMOMIOt2DqZGJb62mpZY+CRSXy5pXsgLCJEYfMV4TZe8hgU26gSvqJFEKF
 J5qRfydDkP8c8B3R27xJMJ6lvKVoaLu+5H6guNZ4/4i9AHjYki0LeU+2dbHvRiyJGksianlIF80
 A1jXBIZiBatGeWUa/XviAImXjCUrUabdPiyn4ikiDevOmOmZFWgb4iVwhWI87ab7F0AXOttf8+Q
 5gR9NirMNAjYwqJAaYCM5MUw6VwRff7gwS6EdVNPiWgsBC8G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 09:42:59 +0530, Niranjan H Y wrote:
> ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info
      https://git.kernel.org/broonie/sound/c/d12dc8c558b9

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

