Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CC364942;
	Wed, 15 Jul 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124833; cv=none; b=TFwH0qawNDmSl8Bw5TBJm0PUAr2fixvr2jred3N3lnCg6kCQi7Iw+esl2nFirZ1KL2YImPtzgeUP/8zPeviYWjOgADqBYOidazalLWxKJ5eBQ3xSvyxY0dB+FnF2OP8hYtFNRpScQfztM8+p005GoKCa0WCK6kQPYyUuc1aD5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124833; c=relaxed/simple;
	bh=SvrPRkobrgxZ+YMsNfyrIQxjA3UR/3In7AADN9dDk8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t+5Mi+0W4FTrgulwHfftXl1znnbK7BWmDRpqfPsy/na/Z8QGasKVzVfqY2ggrw88OG5DxcrkRhHSvqS2kNbv471gZgZwX/9qfDhUXwyrWk+t/BOdGTh3OPg38LSr/FzNx6F2qOP7HqrKlKwR4h8CmxTjUO34jfy4QvImtbG1VPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0003-lpass-va-macro-close-thread.eml (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXo0GYlVdqWz4CAA--.2559S2;
	Wed, 15 Jul 2026 22:13:45 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject:
 Re: [PATCH] ASoC: codecs: lpass-va-macro: Propagate regcache_sync() errors
Date: Wed, 15 Jul 2026 21:59:16 +0800
Message-ID: <20260715135916.24417-3-pengpeng@iscas.ac.cn>
In-Reply-To: <17bcb9be-b1c5-4dbe-9fb7-85745098d35c@sirena.org.uk>
References: <20260704073901.40058-1-pengpeng@iscas.ac.cn>
 <17bcb9be-b1c5-4dbe-9fb7-85745098d35c@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowADXo0GYlVdqWz4CAA--.2559S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYz7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k2
	0xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUouWlDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Mark,

I checked the current sound for-next branch. Commit eb667d0fbdd3
("ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
PM") now propagates regcache_sync() failures from
va_macro_runtime_resume() and restores the regcache and clock state on
that error path.

That covers the issue this patch was intended to fix, so I will not
resend it. Please drop the original patch.

Thanks,
Pengpeng

