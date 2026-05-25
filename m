Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA62BEC27
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739842; cv=pass; b=G2380Fc7GWqLn62oYcvSmXiidWPpqjK/NPp3QsMwWtSR/spg2Avnib3v+nXRLqAKmAFNRlVkGRq6Ip/7LM5tfqag+LTppWT/tWxOZcEEs9DsvgjspHaqr1JqbCU/PAA+C2gs90FMdvxl3nYqBPqFf3GT5FnyIgwe3HdmGWrlBxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739842; c=relaxed/simple;
	bh=x6Tj3NMAK5eXjLlzAsqyPWbLJ9Yd3AqNE7H9h4zAWHo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ap4HQNeDWexCL7hrSmhTbWUycBORE1zd6+eZjw1tUVI2nAKznUVN1HBL6EPTBgsyBashb0Ckt+xbau8w0BhXtXroRY3daYkBaz3vI/IyF6sQwL828sZhWnBS76UWEmzwy/zkNFByK4/eOPJ6yyEZqn+vmpykwlh79BvpkvN8yl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q79qQ41J; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q79qQ41J"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd6f65c781so80489497b3.1
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 13:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779739840; cv=none;
        d=google.com; s=arc-20240605;
        b=AUxV29/yBjZFECJ2nanger/bJ7XiaLvvgdwWOyDdbwNejy/kLpcDBHpHYKkGAbGsDl
         9ToClcxeFLWA73jEHc+rZ+lsZvMXAYCxb1hHYH5BRor1cCCkNWwPEp5YI/WUAiQnub/l
         aZRJykOEzpvlp6+8F5qeqtuyRxTkOfg43s0nMpm347bqWDrlN1CMkoa7vqIHIe45GOM3
         4YxYgdtCiQfjGE4vJkYzSO1aqZlWbloH98sUQhdR1Ay8pDEGmebG7w+s9Q++MD44RqIa
         s2oCRNDGyQdBCHhhrj/RbcyJ1atHzSMqVaWNIEWl18x9OMvpH0rHdNUtw0LxZ4BOJOXe
         HTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JNUkqSi6bvD073B++Dq46n6N+B22ce39C2hXDvivu8A=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=XpF0jkxjq1XsPnPsjPsjFzHM0KnLTkAibfIkrlmUTKP7IebHiZ/S9S/8hVfk6Uul6I
         36ij/3ErVx9LCYQ767lKehWab2pmMHr9D62amQ94ufduomnNBcpM8NOvMs8KfxNW9Qra
         sOSrIUcBk2/MvleVkrYW8dtObBLbMD+U+bJ2rBlUV8+y4EkdLXhk70lmyswECJZrkDcp
         wfweDivXiFKjFBnZ0GAxCkFjjD23Z4tJgLVeKgYD+plRdASmDrgPglwid1kFQpj+QhTN
         73lp7C86LSBmCKbeQsflH3bEehwTFNC+dt6cne2qyjpapXuESIl/anXt+9lhA1ft7PuW
         nRAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779739840; x=1780344640; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JNUkqSi6bvD073B++Dq46n6N+B22ce39C2hXDvivu8A=;
        b=q79qQ41J4ZiURhsR71fosDxwQ1EFsGnF5vBqI5JtGmDRCv6RETC85kgKcFKGrhgF6Z
         fdzrdx+z5KcOJvbyviBs9DYzVBbu70pc28s+ekaXRdR9qrRLAr+nMmHXVD/lZlFD4dIh
         aewvZvYKjr8/U6HtSEnxSi5qNQCSHoXBqOE7xxbmj8VBHPlqWOtQL2GGRvlotZCmj5lh
         F146yo08YUcP/c9bGnwFR92tYyvitn6A2sTvAZx/auM/rDT0Hck1+LfXQjWyTKnUDjXI
         JfQR2UL+Ub1P23dIuVJ4PxuDYfeGIy67ytIeo9BZIc+ddRHA/v7X7P7mvuU4wjUKGale
         5Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779739840; x=1780344640;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNUkqSi6bvD073B++Dq46n6N+B22ce39C2hXDvivu8A=;
        b=gJu2awQe7lY+NtpF0hpQVJSTUPzLT/Nqb7gBtxhNT9weOXNXzXLK//9pauvXqKLXeC
         vkYvGun2JMjLweKp3yD5tCeIw8Eyik86BWC1os/mwdkXNdScf5ZxDtEbR1KAkffWR0X6
         /dR19LbSyGJuXBC4brbKyPfEBVXb/PQhHxcsxYcf07Q5wNLnlBaQM4Dr8/9qJyKOaDvl
         DVy3wqV2yFPKQo3w6hqNrXIXg0STzMmJZVOM3U4tgjnVZ8DwMeY6T9mzSf1u41gWVz4Q
         IUrIV3GYKAAjbozbqMMN6twmpRsJrVVSgj6ivdkVEMdVToY61AT2Jq+j7QZRjbYmKUs0
         evEw==
X-Gm-Message-State: AOJu0YyA5Y+osuMoD4LqRKIdMwbSyyJouYjznffEQeE+yzh8GrUeMBUd
	bcR22RQ9kmTveX7YJZEUll+bCTacy6tdQHFlBDiWiCUTOOFKekFCoajt1vNedWK/aiql+pxXmW5
	LhSO7B/UWYl3lxSoCWfwoptmI6lxLmfqku78kEyM=
X-Gm-Gg: Acq92OFYjvdQh9crNv2lmQ5QHPin+k4D713Z4rcsehJgn9XuBMMOF5FXsFKNbCIH4D6
	cSq8h8bP5FHP/yEmV4QXXaPQbQdIleFvnUaRixKKxbrDb7N7xpe2tAQF5sJVRi44TENcrAyZFMz
	nA/S14OuQX3jenyvGCFByZN7bG3cerZWea1Nt4IEsp5AMlZxxPskRr7fhL+RBmvGn2K/e0/fv+n
	IrJ1/4myL8K2hQ6xCIfY01IZNoaB94VZtbDP0B0K9hLipiGET/9wpKXO5WUZK/SlcRFDj5napkD
	QQt+5A==
X-Received: by 2002:a05:690c:397:b0:7bd:a6ea:c50c with SMTP id
 00721157ae682-7d20c241306mr156268167b3.15.1779739840324; Mon, 25 May 2026
 13:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Damjan Georgievski <gdamjan@gmail.com>
Date: Mon, 25 May 2026 22:10:28 +0200
X-Gm-Features: AVHnY4J216SAyRMI3RRjmoRgWpB5fk3AVRwqqIIO4qDLlWU8gwhltMPZpdSwspE
Message-ID: <CAEk1YH47VfFk3dtav3m1gEKJ-OkSu6MyyNcGufWR9fX6miEF3w@mail.gmail.com>
Subject: SND_CTL_LED / SND_HDA_GENERIC_LEDS enablement
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently SND_CTL_LED (on x86), enables the
`/sys/class/sound/ctl-led/mic/mode` knob/feature, where one can set
the "mic" led to either the "follow-route" or " follow-mute" (plus
"on" and "off").

The way I understand is that:
1) It's a tristate symbol with no prompt (not user-selectable)
2) it's only enabled pulled when SND_HDA_GENERIC_LEDS is enabled
3) When enabled, it pulls in NEW_LEDS and LEDS_TRIGGERS

On the other hand, SND_HDA_GENERIC_LEDS is:
4) is a bool with no prompt (not user-selectable)
5) only enabled (pulled) by SND_HDA_CODEC_SIGMATEL,
SND_HDA_CODEC_CONEXANT, SND_HDA_CODEC_SENARYTECH or
SND_HDA_CODEC_REALTEK_LIB

Now, at least in my experience, this knob works just fine on a
Thinkpad X9-14 with the Cirrus cs42l43/cs35l56 soc/codec - *when
enabled*.
But, what I've noticed, while compiling my own kernel (for completely
other reasons), suited to my hardware, with minimal config to fasten
compile times - is that this knob is *not enabled* and I have to
enable some of the above mentioned _HDA_CODEC_'s.


Now, *my question is*,
should SND_CTL_LED and/or SND_HDA_GENERIC_LEDS be more generally
available for _any_ hardware?
Looking at the code I frankly could not understand how it's connected
to the above mentioned codecs.


-- 
damjan
