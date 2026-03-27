Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949EF37998A
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644068; cv=none; b=HEufyzRRJbK8TrxiH0vlI4x7OB0DawTHsBryBENtPzUnOoecr1QKmX7veiqKS9uQcK4B0i1GbdrUiSU7MC/uqb2U9yiPG4Z+RwUfFXckh/a5Ds2qipQDHDBPjwAXs31gDpPMUQowS/FM5b+SwAZQoTiEkYYf9Nb1S2VllYpR7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644068; c=relaxed/simple;
	bh=egkeAdUB5jE1Wu55iZocAbSL5ziBieYJwS+fjgUInv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FFIM7mvC1fa/S3vx3dghlGdrVC825cUpV/+bjqO1ZiGmMdBeQDIERF1otaCCaivo72aUOUVQpjcf40rjRWtPdLVG9ZiUxWXvdrf9jyva0T3dviECiFplEvl0FZc1V6Nf6Y3y0YcJX7UNyQ/6dC5uVO73WOGY+Kf0z6bYUmDBJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKfYI5B0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKfYI5B0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21F7C19423;
	Fri, 27 Mar 2026 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644068;
	bh=egkeAdUB5jE1Wu55iZocAbSL5ziBieYJwS+fjgUInv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RKfYI5B0UvEWZnUCP+Vx/r3wAUziVrvlOP4lo+ISSBwc/ZByNUn0dOLZ+kDaLuFzl
	 YA2ekhxlPmUhcARyl2ovRWB3ShxZ3jxQ85Byh6+5PzNWEi52OF1/+Lj3v0E9y0XxP9
	 kt41/nYQd4CIaxIUVD36BT46uCV67MQJVaIeJDnZ9BMpwAnsgbIY/scqdyHCcsPWmw
	 yFOMfsM+o4I1hv5AAPdpew4z7Btkt/vO1+M4l/WjK57ND8EtG/s3BoD3J1szzQ7VGh
	 3cQo9j0MfZCvvI78k5I1ucxf01gK4TNyHvR5+zdPOSgAAq0yFNRItnrNHuWIfodEAA
	 iLVDnUcEBFZkg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <874im2xa98.wl-kuninori.morimoto.gx@renesas.com>
References: <874im2xa98.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: remove unused dobj_list
Message-Id: <177463673188.777262.3873631317795696396.b4-ty@b4>
Date: Fri, 27 Mar 2026 18:38:51 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=broonie@kernel.org;
 h=from:subject:message-id; bh=egkeAdUB5jE1Wu55iZocAbSL5ziBieYJwS+fjgUInv4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxuti0N0yI4dz05ASgKRwFkk9AtKza/uX9bjmp
 3l3jvxlMEaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacbrYgAKCRAk1otyXVSH
 0JzwCACCJHaRNLwkhBIMb00adhebq7ok4DJrXfYQYIJiJzT3CWguWcJBI890c3poug19Fo7f0m3
 6Ub/12KYjHgX4cSv2EmMltK8Bnp2VvXx0owUR35I1t+yK8dePRxEdYDt7YOd+VsWDxKzXVOl+Nq
 +O0vjAMRlDVF2VlSXZPSgUJgVHEmygKFjf3X9IuahxbPNKjHTex7FCUyxeGXHv9gbI0D+Bqx6Fk
 vjlf+K8CevuyS6/r1gAnoI7CsIofBr1KPX866gJ+fTJtIoQB7ZOUBoYI227VUoBERhR3ryD9NN+
 YKDyarFqpU4sYZ75Up1GJsbOiqpgKyUN6wSQvNsVVtK5RFxl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 02:43:31 +0000, Kuninori Morimoto wrote:
> ASoC: soc-core: remove unused dobj_list

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: soc-core: remove unused dobj_list
      https://git.kernel.org/broonie/sound/c/7caae0aed041

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

