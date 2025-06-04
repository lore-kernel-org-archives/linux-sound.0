Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7828B7F1
	for <linux-sound@vger.kernel.org>; Wed,  4 Jun 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024401; cv=none; b=T2ItQZYMgUdhwDD/RhA8nnWUx+G+xl9kkd8LaCYWjQl+rprB1FBVXIFYeYkiUzG550mE+aaUXe+cCWLUQ4tsgLKG/SaX4bAqRIkJhtfZuCkZ0v3y7lRe2syVptiL59ceWH4vGJXrag59+t4SX4rYP+ArrehGknDtruoYNA1R+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024401; c=relaxed/simple;
	bh=T8WgG1S1oNFrDeQrv5wzNaCOuAy88Btwc3NacmbcdbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwGWYA1ofMKQtF4tS7WhEidFLqsFMZ+LGJ4MH2v3Hop+10TrXALHAfxyrzB1Sr9ugdExC7C/QQXrhAHJyo5H1e6cZKvJmn1+VunOaw2vjD2/6IfxxlcFOih+LdyDjX+toAiC0acinXXi9baV2NYvjrC6bu9wdodsnpL/0AE19x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh2QxbL3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh2QxbL3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef892ab2so834864f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Jun 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749024398; x=1749629198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pYCzyvVuUxf1ykvfMA4e/Vu/0PCYvey3wVDJfkBM4g=;
        b=Lh2QxbL3aKlDxXU8HbfAoOVxVnwC0BZfqxWpasveYn53vJuCQYU7L4jHzPgc8H5E4V
         q4f1mTT0s/oGICmHUjIeUKd6mDZjZj/8dD0ry8uT3ges/EXVlOWljr1ez7QrjTebXDq7
         txO96KDIoVoexC9lPXJgEtgWHAg9SDya0OAfij6clv2f3ccNjIa0mVsIZBG5FSQ7Ax+V
         HD6iBVNC6OoNnjaIcvYAw13ddxdvDx26aUWW0sNWg/qq1PZ8ZCSLkUI3q0c5BtZuzq25
         JnJRUwT5tzw3EBbqwWMSdhQlRSPZ1BrFen6uIiiEJBsoH/fBjFHDjmdsYc+oE6NIZnz8
         VOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024398; x=1749629198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pYCzyvVuUxf1ykvfMA4e/Vu/0PCYvey3wVDJfkBM4g=;
        b=crCobA7T/orgdW/DGE6NvfTGQHmrTFUIzEgsfPSuyXOXJvffSmF7Eq+StozI4cFtJp
         MyRKC5OzGkRZHpodTNDn/NyNs7GEuNMqsLsQwX+t+HmGVKyjEnQ8pj2fDJaXtTLbb1pI
         sW8DmjaX3deSP4yyDAWtKuaMYqL1CmnZ0dttVks7ytntdlbK6qKhcAiOmHh9NGGP0tPK
         p3y7hA29fOLrAfM5rJzw0nTlU9u72pI8ZUoTuAxoYcYWpHex+ud3Gui8x/XluMJlCrLH
         qJDtwSswUjE5RmQ2AmagEy6aiX++S8CIFi5E5Dt3fAUXmT4l3a/rDXvF9eA1IF/53tZ+
         EqFg==
X-Forwarded-Encrypted: i=1; AJvYcCULWY6hsRX9vjRofMNoewVvKnlnsg2u9Htk9YMn0iIfkVYpePCmvzakY63dta9ZetylZft1AfviYXt66w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxopfvaVaV2bcPx8AjVYdLdMh/xX6LwYY15L3jK+7rXy6BakIgk
	8WfP5ckhCyLyLY4OTW47bkd0rosVv4tcLX21ZR0wIbGSpabawzUyfRutgDlZD9I=
X-Gm-Gg: ASbGncsVjIfB2xTHeK3+Pj2F1wLOkZcnCGqHs8gBJf2q6V5HdfRBbrcXDHwXkZd9icG
	YYmF+MTsR+pASWPnbvEjpgYGVeq0SSm+SKWITnO4TnmUfVlWTfS3vWGg9/5LTGQS67ExiLy7sO+
	a1WrOSZJDnckQFwCbY7ASLhrediM+t+cm4oceCu/NndMrR2eaLElWX/fhncdlb0QSsBHNMilCS1
	+tkSknl2Nuh+Mg6cwNBcpTa7qGpdJ8tSrwwvOprGFZud4loN0pzuoz6ffT+ffwoEBdITo7rGuSk
	X/qB8VdNeqy2BS9E/syBjaTi6us1DOjUfg7MhcmYTsbq1LUIeAEr1bWkXxvrWakAoVo/FjKXiyx
	8VW1/4Ib4rggOwj65pgZvcKL+oGK4bMa+Q+dkfA==
X-Google-Smtp-Source: AGHT+IF2ugr+CYuO5R6m+k+nVTMMVyTkAQoZCMAynyAqBF16OKr2HATLFSRU+dGGEAd4mbVnWkCUCQ==
X-Received: by 2002:a05:6000:22c2:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a51d91f3abmr462084f8f.7.1749024397789;
        Wed, 04 Jun 2025 01:06:37 -0700 (PDT)
Received: from localhost (81.red-80-39-161.dynamicip.rima-tde.net. [80.39.161.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7bbsm20597082f8f.4.2025.06.04.01.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:06:37 -0700 (PDT)
Message-ID: <bcc1994c-6ece-4e71-a8b9-9367f6734381@gmail.com>
Date: Wed, 4 Jun 2025 10:06:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: mt6660: delete MODULE_VERSION
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 SOUND ML <linux-sound@vger.kernel.org>,
 MEDIATEK ML <linux-mediatek@lists.infradead.org>
References: <20250531155950.101164-1-xose.vazquez@gmail.com>
 <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
Content-Language: en-US, en-GB, es-ES
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <bd02757e-458b-4a3c-9194-7d7bbbd318f5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 1:21 PM, Mark Brown wrote:

> On Sat, May 31, 2025 at 05:59:49PM +0200, Xose Vazquez Perez wrote:
> 
> Why?

Reminiscent of ancient times when modules were developed outside the kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cd53fa9d38b98ea5ae4268e021c4f4cd68227a5

This is the only driver under sound/ with this macro.

>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: SOUND ML <linux-sound@vger.kernel.org>
>> Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
>> ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
