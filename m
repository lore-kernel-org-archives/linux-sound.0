Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CD32D0DE
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 03:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779248202; cv=pass; b=jbcdEifOX8uMYsnnc8HWlqdAKxnz4qva4M6k0N+QjqYWHvlU7Fo5S3qOVyB+x8do2km5R/ziqd9vWagSCw6hDRKxhomWo5cienustgIV3Kx/OsUDlBfoyx5t3XDKZRYvaqa6/xPGSAPf9EtlPHBWJbTAcobaYIv95vq93ABw+EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779248202; c=relaxed/simple;
	bh=3t/CWpCqZ7v3vfPsKjVdwBwWfqYP5NQK9eXP1u+XUms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9nEsclFbv38wAP2z96u7C99OrqfSn+T0M+sCYoZ/jZf1DDIupJ5uVuOrEgPmnZLwDTQigXujyphE+ZTy83jvDEShSnnoku31ds6LvT3CS0DP5DjwXgpMm9oddRQ9W3BoeVnboyquRnwGuCZ0pI2ELjP4QNhV9HQxISR9vN6MNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZAGtr0L; arc=pass smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZAGtr0L"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-39396f873adso65905561fa.3
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 20:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779248197; cv=none;
        d=google.com; s=arc-20240605;
        b=SjVHCg0y6M+xwIVv9UufX+SmCE3AvaLakcduQkH0DQZGEVLHI/Fam0WdqpgHfAJLGx
         pGdVRcU2xLO+P3zdkW9WyFIs+YFPwcjb0Py1AnkygnwnW92lw/gStqUxDKa2xePTrbHm
         3pCVetJic+hThxrbfnJER4S9RYl7vEhcOiKfQKhqRKgHiH60dHzuGsQNKYSGkllDNF/E
         wKnQXiNZ+8voNAVPCK4XSz/UfeTxRgImas/PfoGNTIi65MiAHiYE6wxEr2KpuzOwlzC2
         TE3gdOZOfg9G8PRiKdG7mLYFs6KDDbz6PQ+J8PE8cPKGTRiT2J3lr1jW4bJzVJEfmmnX
         ORPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8+iVeLc2Pv1jKw67JD1mUH1zdt+C8bk1bl6yHhlC3k=;
        fh=+c3cMUWtWRGDwURNdti4y2YeoXa7GIGS0o5TJcZgdtE=;
        b=cVosR43RvEl6/zXpO5uvMnspgRtVvKlBufAfIXsunIBw9xQKhvfeXpKXajC7mhya4T
         Tby7k1T09WGCQBOTFFCKG/xquTbulJluwAymUUjjlgrV59x1oLCpdKKYnNv6c10ARon5
         NlCoJmPoKSXRT1P+5yfwz1MdxJNPtVc+7FRLQE5x4Aw8UDhbskSoR59CpwX02aHkWDgX
         Q3bVyCPjUD6i3H0sY4+Nc2AgukFwM8X4x14/aTQ/8DuFHoW9X0JODG1HrASbOt4eW99J
         7eXQtB+AuUOnHm8XghxFY6ALwZGDaRn2JqPnDiyuxzxX9yQhMD9Y2czoQClSlagLn/1g
         PgRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779248197; x=1779852997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8+iVeLc2Pv1jKw67JD1mUH1zdt+C8bk1bl6yHhlC3k=;
        b=OZAGtr0LTMidBMeDwACsWf/0o7+SE+rv55uA58rzyJwsSUaY0epdnWi10Zv5wmPJr0
         u24dRfTblVjI4IQKuzpOxL1CEM5/svKllRpF9SyH+L7YmefeRZwvoVVFD15ZJ0AFTdBm
         Wb5ppbgHIw/cODXS4bQ+Jn7fgidSaeuKh/sJxiwf0ETjTUXU7zDJSqdM9ZzjiS15l3AC
         5J82oJ1PYj7eoSdzhjOAVogSDgm1E7WCdKNwa/k9yjTti3t3ldvS1k8H1Lga49TECSJ3
         6CyEybX5n2OXIGrOAqqNy/sO+BAhfFY5o20M+oA/CwXLU4o68nDy4vElpbwRPCAZNOtT
         pbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779248197; x=1779852997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8+iVeLc2Pv1jKw67JD1mUH1zdt+C8bk1bl6yHhlC3k=;
        b=NeEVHZ7s9sWx6IFzvPieE7PyBDZHnvN9cU4pZaHghD64Nttz4pd2AKQlCb2ig/jrmF
         vQ+h/Gh01UMSVRIramMzS2ALKoD9V8h/RMWnHxm8qmtk19p2jNV+fUU29rcLdGjxlTA6
         fDRJLbZXW6vtZUNI1hGSfB/5t/j0F8Pa4nwVrTYTqMnhUipLoF1+tnACDA3DI5wB7iv8
         86/6vX3tQvxPxOTk+2D7E1cAUpE6QX8ygqA9CinHiOBPbUjvcyIFHyIpUH63kWb4rV5p
         iSs3gTRxEM0XiwRpWUNuUGvlBpeYfmFcd002ugXhD8KFuoTAn30EAWdU9BABuappwgFy
         Roug==
X-Forwarded-Encrypted: i=1; AFNElJ+ZD9TG/vorQhb4KSBC0vOQIkFwpy7gBA49zQ6mCyyatm2j/ooz3SJo9gUebt+zjndIDprGqR4vT07XMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznyURR04hK0M9MyP35AmMG+gNg32NL5tJ5BJnipz9tqXz+gU5R
	yXpkF+QOf02bkFWeSQY+jOJYfItbbpLDcnktAcxh1+15GgWImja5SCX/NVI2egY6puinqBNTMiu
	Jk4AbhitwcX8TNnwnRrTn4jdVp0kTy5JO1XHn5/V/O7xpG0g=
X-Gm-Gg: Acq92OGeAZwJxLp6Zw9sXQpfo+tIgnRhCWKUy/H/3r6OppzXfZT95vrfeCpeBPxq8PP
	lquF5lYUGTIU6Q1mRxz5w1yng9onTx/EIQBA/QJbyXesl3xdeMzX1cC41sk3EhiKAAG3kOzDh9b
	yX1wohYl24p1h0/w1y6bPIJtuDgJgnpSuA3Tg5c5pvGPikmAeMsJO8Ds12//7c7835bCb0btnun
	a0JPhzxUU4YWx0mv2G15OuRZg6zJvwJZojX6NgVJxEwU/HtGy9x8l1I49noggdDRPiZ2ySYaYNo
	JaQRQgEaKJBWqM4Ysos=
X-Received: by 2002:a05:651c:b10:b0:394:3442:427e with SMTP id
 38308e7fff4ca-39561dab890mr80221811fa.14.1779248196486; Tue, 19 May 2026
 20:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519150528.4193481-1-rollkingzzc@gmail.com> <87qzn7l5uj.wl-tiwai@suse.de>
In-Reply-To: <87qzn7l5uj.wl-tiwai@suse.de>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Wed, 20 May 2026 11:36:23 +0800
X-Gm-Features: AVHnY4LjOprfSFCQ3Zgsw-Dnzk763wV4rK1bO8_GSOPuGExWzoq_eG_8V_AON58
Message-ID: <CAB7XQsFwRCeuBq+DXGHkCweViy18k4ihhvL8F0__Dss0uvhUjQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: seq: Serialize UMP output teardown with event_input
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	zerocling0077@gmail.com, 2045gemini@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=
=91=A8=E4=B8=89 00:30=E5=86=99=E9=81=93=EF=BC=9A
> Thanks for the report and the patch.
>
> Through a quick glance, I guess your analysis is right, but I also
> wonder whether it could be simpler just wrap the whole
> seq_ump_process_event() with lock.  (It could be spinlock, but rwlock
> might be safer in this case as it might be called recursively.)
> Then seq_ump_client_close() takes the (write) lock and reset
> client->out_rfile.output to NULL, followed by the call of
> snd_rawmidi_kernel_close() outside the lock.

Thanks, I looked at the lifetime rule again and I think the rwlock
version is a better fit than my v1 ready/pending/waitqueue scheme.

I'll send v2 with this approach.

Best regards,
Zhang Cen
