Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0403557E5
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473437; cv=none; b=DC5hfTD8EHsiaQg1UZHAzcYOGaGj6epMvGJEh7ktwSfiDeCQR0KcWQ3KT3IBCVcAm6nCgKN1nNMOnFeM3+SFfblE/8o3M3hKyMYMkbWhnamb5M4GNAXMywUyyb5uQePYvSPvApjZw7K7ScXzsFP5TnTFygaM2CBsPtNG0u+raLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473437; c=relaxed/simple;
	bh=REeBbwuqMyRpGW1LVwOJH95osbdw/G+SMx+T9V2nnLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9Ag9jcTNw5Rj7iFczc/x75rcBrDO+3PW8KwcMIMg8S8PWV5N28RZSy7qeR4dsUv4wZhVjxcZP2vbHXsX7A6yLJFCLjaLVlEFRpnRbFGIus6BY288olqsbb3Ow06MkZoXXwd8lo0bf2jS1Qjtg+MAlaq/uIDG9+e+k3eqAVWP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=RNC9Faiy; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="RNC9Faiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1762473428;
	bh=Uj/LmHFOhg7xXjmPkxbK+BugCECzjfx/qf44oxYtmlg=;
	h=From:Subject:Date:Message-ID;
	b=RNC9FaiyoGZyoQk49/zvL3XZzgVGbWOYTnzguf40LSMCcs1fE01aKlgAsSSJnClnD
	 JtjuUa0S7NYCJQ99oEn0hTAWz255guI12pctVOyFMVWYKzua4LnvxwEJd/kkkyYJm2
	 Q12rlejc38+tWusY/czRdvgTTFDHYKuXtth7KHJQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.59.250])
	by sina.com (10.54.253.34) with ESMTP
	id 690D348A00003EB3; Thu, 7 Nov 2025 07:51:41 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5022686291998
X-SMAIL-UIID: 14C3562B3435487784262071662882EF-20251107-075141-1
From: Hillf Danton <hdanton@sina.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Lizhi Xu <lizhi.xu@windriver.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Prevent urb from writing out of bounds
Date: Fri,  7 Nov 2025 07:51:26 +0800
Message-ID: <20251106235128.8908-1-hdanton@sina.com>
In-Reply-To: <87h5v7ru58.wl-tiwai@suse.de>
References: <87v7jnfkio.wl-tiwai@suse.de> <20251106143506.720545-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 06 Nov 2025 17:41:07 +0100 Takashi Iwai wrote:
> OK, then a fix like below would work?

Test Takashi's fix.

#syz test

--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1362,6 +1362,11 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	ep->sample_rem = ep->cur_rate % ep->pps;
 	ep->packsize[0] = ep->cur_rate / ep->pps;
 	ep->packsize[1] = (ep->cur_rate + (ep->pps - 1)) / ep->pps;
+	if (ep->packsize[1] > ep->maxpacksize) {
+		usb_audio_dbg(chip, "Too small maxpacksize %u for rate %u / pps %u\n",
+			      ep->maxpacksize, ep->cur_rate, ep->pps);
+		return -EINVAL;
+	}
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
--
