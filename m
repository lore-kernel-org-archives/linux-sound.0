Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7F4386C1E
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107905; cv=none; b=Yk8ZpPiTWeP51k8riYxAkQB4hrA/tgEZM3eObSH/kYMJorTkWch4CwdsmlgIobE59+GAEl1EmtFc69fUr5xBhzhzFRpnqzvEyN9IFSF0DGdmvt/jGBl9M++fWmS/iTsXnJIUgrgO/x2VFoo5LJEOOxT2P/iHcF5VMrawdFtKCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107905; c=relaxed/simple;
	bh=bK4iOFcZcF53f18rKhMIm1JIF5CClimXFXC6aWjBKYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8ZSy5Pbd0kUUyHmU6YJlIuFyKgv1272IyYJEpiHbwHHV2x4EVx9L7gy+iCCDOxH5HykWAjb/nUeVtRWxMsgv3GbGby1dkWlmqo2GdEG2xrCdrltrmkvQsILdVey/WThxzRkFfQMph9R5iFrRmPVUYg5015mFcs+4qOrBsS8P/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+nAZbxb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+nAZbxb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2081954f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786107897; x=1786712697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlJrxjql3aaRTEFrOM8XlIdZQrfl76PpNhcigTUBoHY=;
        b=m+nAZbxbvurn54axd1QtUKelUKUOJAuOAHGBDCZyExVbv4bHD9EdgR11UdwSKJM4Y7
         ely0YcS2o5Iot2Wk1USA2f2AAMnbEBKyGTDdt9W65TufRMD20JmKWk5mj7xv8tGItu1w
         ezLrIrXN3exLqU780w8KoCGWRfwdsUdI5M2Ls8RNcfpgXqBAI5voC8DJ7lHd6pbUuX8W
         jiVIaTNw1YsaQ1brayC6C0PPTj9CpQ4JdqtQHXGIrkUZ8ieTZ5IIveNyAkuqc7df3UzT
         s6I3Y1zdFCzmKvSbC53Or5DbtI0ZnJ9I671KWiC/73SniOXa0HkLPaH3xKP2UYh5rQ3C
         rMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786107897; x=1786712697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlJrxjql3aaRTEFrOM8XlIdZQrfl76PpNhcigTUBoHY=;
        b=L2Lb/AJ/kzULF9PTDmPZYNkPPt2g9cqpg2g7QRfBJJ6w4LxWZ0mu7JTVrKbFzUKYX6
         H5AuJ/Zh2Xc7nUzuxu3erM5pNYBKnxcKajlzPEPrgQ1N3yw6Et2UPNTwUFN+2geJH4YM
         0S9Y3ZrgfNegHkQVMiKlEgYNkQT+zxCQI+0ZjlaqZ7Dy/ImdVfvQg8p16VarRk9nMA6j
         CaKDE340WodGEggm/Scc1848WjiUfcbEZTuX7qWlsLs648GMYWCzXnc0Jk5auWkcP884
         QJWHX6SWyK84KyehmHXiLrbEWxEAW4xuSvWRXHQ9C6P2dj6lSJ9OnSY24woSxxlf4liY
         cMQA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ0Ynuifq/MsBOWwyWLzisPDitdAnnGHnL1KFbZ6LyL046PHkQprXsrKPg5LD5huw7Mg6cDrs8ryFwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ160hpzWKw+YcXDxPe2zefjorB76Q4w/0Y5hPtt5G5kqisoIw
	JPMh5AZC/uieAE2/l6GIrVmNiColiBYHjTcOYfLkG98oaEbK6s/UhKbP
X-Gm-Gg: AR+sD1276d7qlvnhVnQdN9+NsYmv0K4wNZDmxKhMue+3WmFZVS2a+Yf8p6zk4T/kGro
	AJh9cw+jYmllI2mCVwswYH4+2pqLZQrNAsBt4On9XRth+r/jxSC8OiIApnGcP5d37dPnsra7Ymq
	cbZPU5gVkYCA2sAF8Dmaij7JZKaNNAZLD0nPIkV7dtTioalJEdwn01ojwosUNJXXBFXoRJImlxb
	oK7w6ngoox7WPNWNh9aifJ1iZ6pduGuWFFKnHpFk9sxAhIv9eTUNbIk4K1QKUhPC1XVVqDuqsgd
	RtEaganL7JFZgPjWRrkaCciKYmc3F1dEdhJhpuSTu4GC2oX48evI/4kG3hgKtkRDGOQT/v6xJ5k
	+PJcC2N0MH73vMhpWPD1WmGNx5YlIifdVvwJLP+u9TAs1mzPg2PEOd4uCrCyhuhtocTcFSrYvC5
	oajOwNqbA1u7C6J4jHdcg8NeFfbO96SO09g47p0DFhpYNfs4tG0Sdfl8qhXJK+dND4KDEDYzKaO
	r+LNFi/d3vhjW+TYGc/Dl6++w==
X-Received: by 2002:a5d:59c4:0:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-47fec4e887dmr34364488f8f.1.1786107896575;
        Fri, 07 Aug 2026 06:04:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145589sm6261890f8f.1.2026.08.07.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:04:56 -0700 (PDT)
Date: Fri, 7 Aug 2026 14:04:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Kees Cook
 <kees@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
Message-ID: <20260807140454.1014cf33@pumpkin>
In-Reply-To: <87jyq2azz4.wl-tiwai@suse.de>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
	<87jyq2azz4.wl-tiwai@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 07 Aug 2026 14:15:27 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 07 Aug 2026 13:41:32 +0200,
> Mahad Ibrahim wrote:
> > 
> > strlcat() is deprecated and slated for removal once its remaining
> > users are converted.  This series converts the sound/ users outside
> > of ASoC.
> > 
> > Each site is converted to an explicit offset plus a bounded copy:
> > strscpy() where the appended text has no format specifiers, and
> > scnprintf() where it does or where the resulting length is needed.
> > 
> > After this series the only remaining strlcat() user under sound/ is
> > sound/soc/codecs/wm_adsp_fw_find_test.c, which goes via ASoC.
> > 
> > Build-tested with allmodconfig and boot-tested on x86_64.
> > 
> > The generated strings were checked against the pre-patch code in a
> > userspace harness for empty, whitespace-padded, exact-fit and
> > oversized inputs, and came out identical.  No audio hardware was
> > available here, so the drivers themselves have not been exercised at
> > runtime.
> > 
> > Mahad Ibrahim (7):
> >   ALSA: ump: replace strlcat() with strscpy()
> >   ALSA: ac97: replace strlcat() with scnprintf()
> >   ALSA: cmipci: replace strlcat() with strscpy()
> >   ALSA: caiaq: replace strlcat() with strscpy()
> >   ALSA: usb-audio: replace strlcat() with append_ctl_name()
> >   ALSA: hiface: replace strlcat() with scnprintf()
> >   ALSA: usb-audio: replace strlcat() in longname construction  
> 
> Honestly speaking, I'm against those conversions.
> Why do we have to open-code at each place with strlen()+strscpy()?
> It's just harder to read than strlcat(), even more error-prone.
> 
> If an alternative is something like this, we really should reconsider.

Agreed.
Changing the code to not need strcat() is one thing, repeatedly
implementing a different version is silly.
Even using seq_buf isn't always ideal.

	David

> 
> 
> thanks,
> 
> Takashi
> 

