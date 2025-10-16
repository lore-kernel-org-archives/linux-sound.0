Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D784D330D4F
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618529; cv=none; b=XSNLGRF7CNHj6iiJd51ZfBOFtcehil0ddMSHLRP7C001EXRE22+T9GcDhq4gmRVc0lDuhDwj8WTaWpc7Me7VzKaesR95FW4e2AXGkL2J/BDU0/gUDt5GJ8K50Q0RQ9TuGSd0992oT+6BIJYc28FbDu+efHcHOxPX0wuXc6rzxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618529; c=relaxed/simple;
	bh=LJ9FOlNwCeL56uX2j9CNg0LwE5v7gSjkbtURcn3WDOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KneG8uTBJOz9s8DjxX4vOBBssi3gj/r3yKwN/oqv+QDHzpiXryOSQ9o2TZ3uKTc+MQQ70KbxRkCzggLYsx7ZPli6hk4zRX6F+rJAxuUWV3UT2NcnWBSUGUaxnO5FDnrO9F+1pi4kPsooyda9U8CIh5HEey9tpyIgOQ9wV7HhUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNbr5DSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNbr5DSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCD2C113D0;
	Thu, 16 Oct 2025 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618529;
	bh=LJ9FOlNwCeL56uX2j9CNg0LwE5v7gSjkbtURcn3WDOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LNbr5DSUq1Etvb58trQohOpReNqyQUrG58egKJy7OXLChiaKOHTiT1pz0DPJ4+qPm
	 Dlrk+ge079wuuAzRqWVqdOWTTkgmlseqXt3M/200XT8EwDpG17q88YyPm5rHj5Ry2T
	 aB54SuKx8Bh1WBPRFYYw8tTHEJ4eQ79aWJyuXHTxpv7dH+e2nH3neadTz1CRck1vDz
	 vHu/yyZMsdxC0Xg9G64Y1ApzBziUwrr63Way4hd5sL6JD2R8en/Rk4hSy+TmZNxNpI
	 IffRAN2lcRJkoAdwKCgehaWvSAGHcvL3mEcrQocliBBUhpmmRvn9Q0dezxzZRUPnXZ
	 IyI3Xc6EJL+kg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, lgirdwood@gmail.com
In-Reply-To: <20251015134215.750001-1-sharq0406@gmail.com>
References: <20251015134215.750001-1-sharq0406@gmail.com>
Subject: Re: [PATCH] ASoC: max98090/91: fixed max98091 ALSA widget powering
 up/down
Message-Id: <176061852842.55339.2064404144118312945.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 13:42:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Wed, 15 Oct 2025 15:42:15 +0200, Sharique Mohammad wrote:
> The widgets DMIC3_ENA and DMIC4_ENA must be defined in the DAPM
> suppy widget, just like DMICL_ENA and DMICR_ENA. Whenever they
> are turned on or off, the required startup or shutdown sequences
> must be taken care by the max98090_shdn_event.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
      commit: 7a37291ed40a33a5f6c3d370fdde5ee0d8f7d0e4

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

