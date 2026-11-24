Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620175;
	b=OLnagpJlZaLOiFkfnOjq7UMD1YKvcx2dEZ4SZguWxb7JLLG3bhjTI3xLVeVwxgHLghFJ
	 8b2HY9ZC9tFzQ8JMi1W5zaKMAotDhQUFG//idSeS/Q7ELGG3zDfHBlt2Hji4YHYVIQ/4v
	 Ht1AwR68Kc3tOsKBWiP/1yrRyKXjCHUay2sMEzrLo3Nm3V3NdO9fr6n5uWZBmzy6+pEWr
	 3Hufn1ee2LBSL3mn+n8xicU6U8/5aVuGeyLkrKkZue5LgKFtQiieWegjb1dpY81RIjBkF
	 ltbbA/QLesKXVsEhemgs9SQJqGcUhbcQQb3VPUaBibEnV/omjVL/nHO1F9VHktoH+wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620175;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2PzTqrXPZgDKBf+ilRVzcBZT79IBr1BJuxecq2SrYVk=;
	b=ZZFh9zNjopTCOhIwH5hcWSPk+fD/+AP0LXXCP81UwZw9bsrkbMCTv/epKV6jDrAuMP4k
	 UCeKuegA4Q84nfSLmbwHgmjw/3rPs/zrDERB+EV+Uv9wzV54J5sS9y43WTHZGxiHP09/j
	 TEFSFXFb/Iu2oq8Q7mdJ0PRmrr5AQjIF2yBzwF0PggpvzkavxTPO8H1hZ01IiTJfmFdzy
	 DEkgS49WP0B2h7sMEB59MPJnHauOf1Fqz77TnPYVx5D4rcHtjCvfAVaOQj42H66LpkJ3M
	 oR+Rit3t1ZWs2P2B996xW5nnH1OCLnjsvq3karQxkjmMy+YzhvR36AYclI3FC97M+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1BoYxqK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF01606A31E;
	Wed, 25 Nov 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1BoYxqK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742F81F000D4;
	Wed, 25 Nov 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620175;
	bh=2PzTqrXPZgDKBf+ilRVzcBZT79IBr1BJuxecq2SrYVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f1BoYxqKKeW4BNch70yc3LBvNU1UFj6RCcqTCqSMpNkmhQeZvy8EmYrwEGGwqai6Q
	 /8KqC8nS8OeUjlQ7jPNXzlSNQyqU0l1RI7d7nd/c2PqfSW7SN04gyPMVfwRoatTOTx
	 tHr8j8wo/jpdY2RKkToWOGj71QL6XDBq8XCJ2iggMCWmsCw1M7wqwWRxjLULBCq0mL
	 2xPkTgqPK1OQDX++HNxLGoPgfcIJjoLMP8ZRqFz+IAGMq0geqEEoZhVpvmwVt5EpeW
	 W1A32an4fLMZfUCoIXxT1OHUw1rB1rVMhADuTsxvfuXTmQUrFS3PT83VO1ieWMswLA
	 zUwtVUSLK9/zg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261122090640.1475222-2-manuelebnerli@mailbox.org>
References: <20261122090640.1475222-2-manuelebnerli@mailbox.org>
Subject: Re: [PATCH v4] ASoC: doc: Fix bracket
Message-Id: <179554508712.947306.12735382898664151388.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:31:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tdpJWr0GNwgSHtdlCqBSZJ3ZESMGjRciWBISd90I2P4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/nrral87KynolpmbuNLl1olPM2dXfG/522WTyqJ0S
 YAtQJuto5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNxPszI0FTpcGm9wst11QKh
 B1SYn1if+OFp7pcg8sXwn0Ts3yVmWxgZZrk33V+Wbrg2bx4zR+DJNWXfdkedm/Ogn3WKdGe1tbo
 sCwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 22 Nov 2026 10:06:40 +0100, Manuel Ebner wrote:
> ASoC: doc: Fix bracket

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: doc: Fix bracket
      https://git.kernel.org/broonie/sound/c/caa42517c9d7

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

