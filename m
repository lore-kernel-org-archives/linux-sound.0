Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D545A28B;
	Fri, 31 Jul 2026 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539924; cv=none; b=qBW+GuTeU4Eo5UT6KZO2syV87HVUgHyTXc/lnxDvUFz4yuK5sBpMafQ+TJevelWPr6o0fuEKMeguhkC5oHQptMVRgGIbXxTV65GLhFHKDqbC7/cUudiyFhwwGV2eWeAYaUbeVYP6SYJrj4HpBRAWgPZ8Vnuh2VzMnX2JBZ+391o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539924; c=relaxed/simple;
	bh=ouhI8Bu0VNy36bWHtW9fIvBU6k0xqBCknk/8pb5OXe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bkrUInLaMpbHFla4Y2nFHQ3B01BNe8WpSlUHkIdMSZW5fNFHze2LBTF2setYr2K96Pf3ttBBUlJ0ufMwrvrZugb+YYcC9nFHCfE9Zl+GRb3fmWopqlWYK3nZmSrTN950mtvq0mQduppd38bNthIKv0/CmBQp9lL7ymY/KfgR1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnNFyNsx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnNFyNsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA261F00ACA;
	Fri, 31 Jul 2026 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539923;
	bh=My0RDPjdUFtnVRzItkdLIM5hSNIeE9jCXi1b8cFUUl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WnNFyNsxuxHsIs3QIHHMRbfuLAXageIMx5WAnE8OPBypqr24s/71gkRmC4ksM62c9
	 RU6hUoMtN86kZEfEkvPOSQVB1FoDTXoWC6Bdc4EdGiF3CUgN4YBcsUGOtflopenGdX
	 QxjzWbF33JFOEvR1iNoKeOP6oZYBsf84zjFlMAlcBwrbbMnmN/YY7jADGhydZCBGNJ
	 1RA2fCai0CkrG/3LuLSDaDkZZXCZ4WZO15vNg64+D/C30T8Ef8n0qZ/gB5YUhdWDnE
	 eiWMhIeo5t6dkZ54Cz8vY9Ku62BJbS16GyAGlBMDEK1E7zPKIYDXxysyo2tb+kJ9sR
	 PLhZbz+ME9S+g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, zhangyi@everest-semi.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260731151826.961912-1-ckeepax@opensource.cirrus.com>
References: <20260731151826.961912-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: es9356: Remove unused headers
Message-Id: <178551909055.353541.6452745689117942338.b4-ty@b4>
Date: Fri, 31 Jul 2026 18:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ouhI8Bu0VNy36bWHtW9fIvBU6k0xqBCknk/8pb5OXe0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS1Q8IxHdjSOqYML30PElHdoUI+9Cv6pm0lnk
 gEolP/SxsOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tUAAKCRAk1otyXVSH
 0HHkB/0Zv2KbOvw4yfNgEw9VsGItLNCI/oaOkDAOODu0/aJcixxDWJXJyXqvajCfFkhepCPhrdN
 rrUBGGFs3HY6sAVAFLie1EolkMDOAFJc7rrr0CXwibVXEeu3gjK7+KjkEI70InIurYfZYYbWtPa
 5MH5i169YTTPWSjtuuVG6N6TgJpljeoKwp5wKilmPWdj/rzafX7NXwA4CKw4bOdK12UgvAZ6biC
 ehNMrVAr9IjS8PlTMyPoRr/0aVedWQ4MUCG9cCXjG4J5YX06eXoUZaG96jUGnygePRn0x8DGwdu
 mjehSShJp+A1vTpVlH/zOWHPnlFfC5DnxRXWUqpLC0XCw4XU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 31 Jul 2026 16:18:26 +0100, Charles Keepax wrote:
> ASoC: es9356: Remove unused headers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: es9356: Remove unused headers
      https://git.kernel.org/broonie/sound/c/8338deeb8fc2

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

