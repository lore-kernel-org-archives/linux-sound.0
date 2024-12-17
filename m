Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483B1DDA17
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424555; cv=none; b=OnwF/5houS+q5nTgSrNokMx4WW+asW9VZet2JNiaAeTD0ika8YDpoR4C+4NkSp0/r8YvzQwy/Y7QNVVoxx57hvyf2A/XXnSDbZQPF+GmQ2+WvmaLrfUAbg0HOjMU04WcRFtuBedRd5QuR9NgStCvJukVa8dm9vRenHEP0UMf8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424555; c=relaxed/simple;
	bh=M1FONKwZ8Fc/UcnyGVedpCFcve/G5FPu3fxDUKLQ3xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VRU1cSHTIFznmLCpMBAjSQp/IBTgK5ryZcF9U9pOeNzw/lYr4/f1UzqKDYnPQu5dxVPGsEmnWgzkZdRGhelbbWSdVDv+paIJ7prPN3Fw+5BkEiz73kKmc3PARAbkz/UT5SxrCIAasCax+3netq9yfsM2WoIpBFK81vZxVJQqT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+sE72KC; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+sE72KC"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso8931941a12.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424552; x=1735029352; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V92mVpmKQ/0E2k4933aIN1ZEembCvs+f5SIz9RHIY20=;
        b=g+sE72KCIPZjI81J9YwWSaLGX/h6UjhsYfI5bHa4S8S7P7ngVDlHwwkF+rJH1Auj1l
         E8iVrtlTgUt7q4dYxEJMsC6Xz38jfEXsF8vTLtnBppP86VVadMUaDYVSbd32lXsk0r7u
         YO3koVQYXuF9+d8W5GlORZ7ZZcwWxygdaCZmkbWVqqQdHFtcP3hy86ufr7adDWD6qPQt
         hpyhnhLOp/hmOd+eqJOeaM8oEKA4ZG4iQzNzRFHb7meNB3aPqO53GB/Kys+q7iaOvFJn
         GcrLsJgkd+7YuJuivLDGxADHVgnBqjA2H2h53kjRTf7mEwUFYkmYjXZ3bm30f4Rc546Y
         wUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424552; x=1735029352;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V92mVpmKQ/0E2k4933aIN1ZEembCvs+f5SIz9RHIY20=;
        b=J7ZoRBKehG/mgiEdQgq//5YvGH0inR+K+K2iwCLeaNhHdgP24rQ1VxPJnkcp8U5Wzk
         5X/W9KbUx96eiLfimxUe7fbJJEkebkrEjWWpi/pa7HbSXUYS4CliuZS6slPAK5E/D3Y4
         idPCBcKNaJpmhsuy4T6RuRG0kh4H9+SXEtvAuUohlHbOz8sHrJ7yzhtvJQZMXhsFhWt/
         iRPo43jrGBcL9GLiu6Tbar5jbrghz6eOwRj2wavTLbnaJuWdxXoYaLQT9NbgbeQX78+N
         tduOHj4nZLrtXraHSUz7JBsLNpGRNro6FiRMfy99LWMBG05brLiWDh8wynbet5xwUz83
         lC5g==
X-Gm-Message-State: AOJu0Yz5aYuoIzxKgSyhjXKV2lxUGS9NsJLjKcIDF0MTyj7l4UTLdN+d
	+Qung5y9LEpnxT4TdUM37P2tC9UKqAns5yz+NispqiSVtDUU+ly6ZXbnAfMpLrw4thweN3Waz0d
	T
X-Gm-Gg: ASbGncvvd3hLKAnUd/157MxR7z38nNy+c7L47Q7KUTGY2Vl6kwDafk5TIcTBN9Bt1ga
	Ijz76/JI/vXJmaU4zp7SZ+I/qn2mCacrpHTPM5sS5S+PJtHrdeNtqyRnk5nSMTYZC70ILjln0l6
	y5Gz72h2xPngD8K52CT0KIMHCP7Mq7APKW4dQ/j5tHkSQdipgX8i95blUsqXEN91PGeQ97YOjLR
	2kZl+KzlRtvEYed3VhzKhYsfFdl4HuyDKSlv7ZyrBlHrYdsS10AuSs4+E98zA==
X-Google-Smtp-Source: AGHT+IEs86Nm/OTBOeV+JZMb6jxxlxalDLfIEcYhz/tHC564UOF5gCmtoXibfXLYwXO2hV52YK59Kg==
X-Received: by 2002:a05:6402:354d:b0:5d0:7282:6f22 with SMTP id 4fb4d7f45d1cf-5d7d56175c1mr2327222a12.14.1734424552035;
        Tue, 17 Dec 2024 00:35:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab50e9sm4020540a12.1.2024.12.17.00.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:35:51 -0800 (PST)
Date: Tue, 17 Dec 2024 11:35:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: compress_offload: introduce accel operation mode
Message-ID: <f2769cff-6c7a-4092-a2d1-c33a5411a182@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jaroslav Kysela,

Commit 04177158cf98 ("ALSA: compress_offload: introduce accel
operation mode") from Oct 2, 2024 (linux-next), leads to the
following Smatch static checker warning:

	sound/core/compress_offload.c:1188 snd_compr_task_seq()
	error: dereferencing freed memory 'task' (line 1189)

sound/core/compress_offload.c
    1174 static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned long arg,
    1175                                         snd_compr_seq_func_t fcn)
    1176 {
    1177         struct snd_compr_task_runtime *task;
    1178         __u64 seqno;
    1179         int retval;
    1180 
    1181         if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
    1182                 return -EPERM;
    1183         retval = get_user(seqno, (__u64 __user *)arg);
    1184         if (retval < 0)
    1185                 return retval;
    1186         retval = 0;
    1187         if (seqno == 0) {
--> 1188                 list_for_each_entry_reverse(task, &stream->runtime->tasks, list)
    1189                         fcn(stream, task);

fcn() can be snd_compr_task_free_one() so this should be
list_for_each_entry_safe_reverse() but it also calls fput() on
the fd from fd_install() so I'm really uncomfortable with that for the
same reasons as before.

    1190         } else {
    1191                 task = snd_compr_find_task(stream, seqno);
    1192                 if (task == NULL) {
    1193                         retval = -EINVAL;
    1194                 } else {
    1195                         fcn(stream, task);
    1196                 }
    1197         }
    1198         return retval;
    1199 }

regards,
dan carpenter
