Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB93D9DB6;
	Tue, 14 Jul 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064244; cv=none; b=YPLM/DHocUJP5QVV8+zmBZagQN6ObIurzyRH0gxZpjXgSorOYfstGp9jFkdFMIrYtBdUOZMBuSxgymKK1zquWZynQjyRjm5i9JkkgGL1JSMZ9WftTe73JkW+al5ckATbp49wUefwQv5/dtBUlounpWSJRrcknuWFAp2ieIzeirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064244; c=relaxed/simple;
	bh=YSadjA6VDvnwlSTfyr94BD1tQa3Y7pUEeuq6lviDoOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EbyP5NA2GMYuCnyJK1fcOR4lFJXHGsPBMVuRTA6MiwRaLnwT9HGwyS5kHOFmPp+DNBiu/uSLn6FMywK/U/MD8d612l4MjuL5TbGeMgBg2rbfP1q892NcHkqz9zp6XrIO4haBpyPubnpy0zD4d+cnM13uqLS9zrRNhwmEltfBGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWXnzvlX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWXnzvlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753881F000E9;
	Tue, 14 Jul 2026 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064243;
	bh=tcTh9kL71uJk1nx4BRTKDvRFS1WZs9ACdfjLy4is8aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JWXnzvlXA6vaNiUzhCuGPysKoTnD1Xv58ElXIq5z3y6Brz38Ek2jAZdlQPBQwfy0D
	 Lq7bOPuEI/86D5+du2Obxb/VCJDJGPqoIwbgSxocNGWhPQR6W0d3TmBXsPiqOmRHXU
	 m/bqfoAd2xyAcPC0iyskpP+j8IrGVt7D50xLSc0xzE3B7wnvFUSKN1HhWe8JZETdck
	 nSFRFDz+DEkOYzSWuZQ1OcQZqQk+PtJbLKHnobLoAAjHwcmiKsZHAiT/PLr2YcT/Rx
	 Mh+o9t8NlLVqJQZGMuNFRWWooj3iknLTlf59oSJipFl+9W/7I1Ak1kEtdhoHHB41Ua
	 e0yztUkE+chjA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260706144540.93929-1-pengpeng@iscas.ac.cn>
References: <20260706144540.93929-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: tas2781: bound firmware description string
 parsing
Message-Id: <178402830091.7661.5699161292732694050.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:25:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YSadjA6VDvnwlSTfyr94BD1tQa3Y7pUEeuq6lviDoOo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqjwRh4STdClgm+pKifrINnnTQkOVcE0r1J5H
 7fKaIb2bqqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalao8AAKCRAk1otyXVSH
 0LtTB/47iItob0TVg2kzeVej/bWQPCLeAIZ/+QEhNY0KPHN1ZwAbdqVhDGF1vVU3YhbG/cj8h3t
 9jpahj6o+6MpJAyH9q9ky5DagZF5yEUE8WT7iUz9CmUqIqoFqlnqxEjoQ4Ftax6G40a2V7Htvtx
 YCbfHUroc8hdteTzGqipVXb7v2qHedrWPtVRWCK641/Ouc6EZa1HK5JUhRX0p7JYzXzity6T6mN
 LHHfPmlv8gDZqmiHZzcgON8NHXZW1M0wfB3fIl/31a7Muwq/RrXx7rexJvPdjLbMVe7jh67SQEc
 KU40QWKEu3XdBWr7ypfqoIJY11utTNtD4es4SPY/EwmQHykH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 06 Jul 2026 22:45:39 +0800, Pengpeng Hou wrote:
> ASoC: tas2781: bound firmware description string parsing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2781: bound firmware description string parsing
      https://git.kernel.org/broonie/sound/c/bc889dfcea92

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

