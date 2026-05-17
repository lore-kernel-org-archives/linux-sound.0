Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC93B389D;
	Sun, 17 May 2026 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779024995; cv=none; b=cZsm8pA8Utv9t1sgowZTs7RV2jLBE1JeJua1q4Zl5I6tx0tuMi9dVLjfJIN2rLFkrvvOCOSFFcrNcZ8AyAv/k2tAf8Ph8QUUCrADAGkplidWif3YNaMkDvRr5qu6Nu6aWF0kW/IjXy+Gs9JkMZvTN8/kEM0IPZzF3rpeBy3R1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779024995; c=relaxed/simple;
	bh=AIFFhOs5JIdy0kWOl66nTdT1JXW3g0wMGrg0l0v8gdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIw6il0NUwqKwl9IAOZAObUJwHs785ILCryh5Xy8opBmz0fZTI8pyhIuZRaubf3tXBF636VcM5ngUamppOfL+XT2AqnEtDtnfmMvJT3BYNgSMVBC/GyfDPUSCO18bdeRLkxHl8nUrriSC0zZWCHavytoiyWpl4Iibm3oivccTPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAD3hAhIxAlqlouIEA--.170S2;
	Sun, 17 May 2026 21:36:08 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: tiwai@suse.de
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	o-takashi@sakamocchi.jp,
	perex@perex.cz,
	tiwai@suse.com,
	xujiakai24@mails.ucas.ac.cn,
	zzzccc427@gmail.com
Subject: Re: [PATCH] ALSA: pcm: oss: Use snd_pcm_kernel_write() in snd_pcm_oss_sync()
Date: Sun, 17 May 2026 13:36:08 +0000
Message-Id: <20260517133608.540165-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87tss9t83c.wl-tiwai@suse.de>
References: <87tss9t83c.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3hAhIxAlqlouIEA--.170S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr47XF1UWw1UKF48KrWDCFg_yoW3CFb_ur
	n7Jas3G348Wrn7AF40kF40yFsxJF4vvryrA3yrGw13Kr93JFs8JrnYqFZ3ArWfJFWrtF9r
	Cwnxt3y2vw1IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUQvtAUUUUU=
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

Thank you for your review, Takashi.

> Thanks for the patch.  I believe the problem is rather in
> do_transfer() setting up a bogus iter for silencing unnecessarily.
> So it's a bug introduced in the commit cf393babb37a ("ALSA: pcm: Add
> copy ops with iov_iter").

I agree with your analysis. The root cause is indeed in
interleaved_copy() — it should not pass a NULL data pointer to
do_transfer(), which then unnecessarily constructs an iov_iter.

> Could you verify whether the change below works instead?
> noninterleaved_copy() has already the handling of NULL data.

Unfortunately, this crash was discovered through fuzzing, and
the fuzzer did not generate a reproducer. As a result, I am unable to
test the fix directly. However, the fix looks correct to me.

Best regards,
Jiakai

