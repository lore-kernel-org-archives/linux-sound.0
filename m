Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C6306767;
	Tue,  7 Jul 2026 01:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389407; cv=none; b=mXXb2Su/pfH3EuEYdIl/XfESiZiNZAqQGu37+dHPFQREIgmiB/MJMK29/X7GpW+G6F5FM4o8XgkNw377vQYbatVOHNET069cImldf1s2wY5S2J2ejnD/l5FCjNqAnuvfSDUFtvYoQKcCtkeCOjOPuy11mjSV1MgNugUwkU8/O0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389407; c=relaxed/simple;
	bh=HHBtOWuSDZDeuf4X8Hs6FcoirrP1CIeye+esIiVcX8I=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=tuh8ulP8hqaOSzwCLUTh+2+N6bXFoBRKTFBEeq83JC1VU3HLIl8Rf5Ad1uiK7G8+lGZB9uyPRcHCRyUkG6r4mOlplObJasRho6rEETr2+LCEjuMlpaPXX8Z6bfYnX7mLfaS1hEbzdrISZ/CpAa1a80mIfGhWuznORnCA4o1cHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=V0CfdKdy; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="V0CfdKdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783389393;
	bh=/fJ/k/hXG3UtmhkBz+4SyXWL9AuxAq01gSSQ0bGN//k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V0CfdKdyD2ci2AVYSSoEZyejAHj1US0/drGHR/+WnRYdJlPRKaw6CbusHrMpAFTxl
	 hbNTrW5eqi0oUj7KffUwPHH3wlvI1kMQbZFqcFyN0LuRewE6AgCmzNCJt1eqIodoh9
	 KksotGig42OtRzAdHeqokQI/QssOjp9KWk1eRkig=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id E1F2FE6C; Tue, 07 Jul 2026 09:56:31 +0800
X-QQ-mid: xmsmtpt1783389391tvum93jxe
Message-ID: <tencent_6646D4C4DD2043C165ABDDFE2EAB78F96605@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLRuSXcFnCRrDbMhpfVe23CbjmtsJFv71POVig6I6M0nVeshpOYe
	 iTDf0PMHEIYnHQV21uYlWLiyTsKswhNAtdAH8PvUnKGw30ladsoYi/erZdWt+0H0DblEqCj7IJtZ
	 eqPMYZRvqbWvZachgnzByJ83FYiHAo0dR6K34Xmnge0glzgTPt49HnSXCsDl1Uyy0CcxuItXvhyB
	 JRtHqubYxMI0WHXyMW7gfx6qMsOP58oip9IiSU2wnXq+59CFb1K6a5ELW1U8A0udb1OJWRBSBsS0
	 sQNESQ/Jk0N7skq1lFp/tNzxoti2balWxZX5yi4r2d4vaYoq0uFAlDlqVzfBQRInhcnhqx1EjKmB
	 sbeiEtRYkm5drkpvVPbttXhMDMxcFEy+WlfgGKapYbu90EeXYcAbFJJfulJ9dDEZn4PQMU1/c6RC
	 xUXafIrlbFlXrCOBOlsThE11wrQvkSIz14JONSs5DSNwDVes0CQkxMXR08o94bCvH+/AIqkFhCSm
	 W0BmhhhXQ2sCQ9+h06l87iFGVzSVLXZIpmrGrRVcjgjEV4zQyB8cgWgyPo3mrE3cKcXo6birIJit
	 OXnlbmTTQckjGDPLggOiLW8plMDcFeqTe8fkYj1UBookBjod+JdpOadRKT3w2cCxnR3kap7QJn9c
	 1MfQR1OTP4IOlAmgo5NcCUkSeTuzG3ia0SJ7z0/G41+jB9i4NEJtGIHt1sCpnD6kqcGvxMjq2oai
	 vYc/M+pxIENIIDkefsZdQh7MTPIvemKaFUBT1dL0YtPaEoJBlwTSLWe9HyQUxXL0gasMDjw7II6y
	 HChc6vISM6iqv3dqXazHlklXNR305xYeXggpAoMV8xvsAR+zdag1j02AFV40FKOjfWozmim2/xsY
	 artSJlEWUnW8M3WPz9OkjjArCFQxmUzKLCG1XLfFa1GDf66xpDOoIQOkI2+7DxLdJQ7kZkZgLAuN
	 G6Z99VjjFLh7oW8iyB53/Rv28w12V2oGC9AR/8gYyU4138QRqwrX1AntRWtHSguOjdGYUT5PWV8p
	 k+tjfy8ap1bSQTbU6RWsXMb/KV6kSto+FJMrdIuoHHkhRqXwgg
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Zhao Dongdong <winter91@foxmail.com>
To: tiwai@suse.de
Cc: joakim.zhang@cixtech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	winter91@foxmail.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/core: fix memory leak in snd_hdac_bus_alloc_stream_pages()
Date: Tue,  7 Jul 2026 09:56:04 +0800
X-OQ-MSGID: <20260707015604.73256-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87pl108lp1.wl-tiwai@suse.de>
References: <87pl108lp1.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 06 Jul 2026 12:19:22 +0200, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 06 Jul 2026 10:51:11 +0200,
> Zhao Dongdong wrote:
> > 
> > On Mon, 06 Jul 2026 10:11:56 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Mon, 06 Jul 2026 09:41:10 +0200,
> > > Zhao Dongdong wrote:
> > > > 
> > > > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > > > 
> > > > In snd_hdac_bus_alloc_stream_pages(), there are three memory leak paths:
> > > > 
> > > >   1. If snd_dma_alloc_pages() for the BDL fails at stream i, the
> > > >      previously allocated BDL DMA buffers (0..i-1) are not freed.
> > > > 
> > > >   2. If snd_dma_alloc_pages() for the position buffer fails, all
> > > >      previously allocated BDL DMA buffers are leaked.
> > > > 
> > > >   3. If snd_dma_alloc_pages() for the ring buffer fails, all
> > > >      previously allocated BDL DMA buffers and the position buffer
> > > >      are leaked.
> > > > 
> > > > Add proper error cleanup: free buffers that have been allocated
> > > > before each failure point.
> > > > 
> > > > Fixes: b2660d1ebde1 ("ALSA: hda: Move HD-audio core stuff into sound/hda/core")
> > > > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > >
> > > They don't actually leak, as those are supposed to be released by
> > > callers (via snd_hdac_bus_free_stream_pages() call at destructor).
> > > That is, it's no bug, per se.
> > >
> > > Of course, it won't be bad to clean up in the function itself, which
> > > is more self-contained and safer.  But please rephrase the patch
> > > subject and description, so that it won't be taken as a security issue
> > > incorrectly.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > 
> > Thanks for your review. 
> > You are right that snd_hdac_bus_alloc_stream_pages and snd_hdac_bus_free_stream_pages 
> > are paired, so the extra free call is unnecessary, please ignore this patch.
>
> Well, your code change itself is fine as a code hardening, and I'll
> happily apply if the patch subject and description are updated.
> So, feel free to resubmit with the updated description.
>
>
> thanks,
>
> Takashi

Thanks. Will update the subject/description and resubmit.


-- 
Regards,
    Zhao Dongdong

