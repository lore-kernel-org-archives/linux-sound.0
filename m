Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED7A32
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398388; cv=pass; b=WpeWYzZWHWfssyz6gi2Dg0jQUuPy5RCeJnYq8BCsnOsFw2K3Ehk/LvncqDw0GfoWxAmZ4eoBtrKwCsmd3OjBjHlCwfxIRs3MvS/qbZgheEt1VdtJClXHvEGyTAe+cE6sRJ7Ytc+uB96mONse/zbOghmF0McOpO7MC0muidrErFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398388; c=relaxed/simple;
	bh=KoNv1Eg+sLA8Y0WIiXDh26qWmuuO+SU+nXHHtNN3F0I=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fYDcBWFs3DOJo3Urr1GPkn3+AIex7evwThgWplaVj3e1hyptpFVqtX6SGLwxpeRnZwHi6T4FE7xY4PlNcCYuLw1z9mAmiHRk+0ipwx/xrDWTUYmQumpr8Mzg2LrzV0XZHEqJ6AMvuTXAv8Znw6JzBqun1nJYx+GuWe2jrSjoRNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=boschmann-softwareentwicklung.de; spf=none smtp.mailfrom=boschmann-softwareentwicklung.de; dkim=pass (2048-bit key) header.d=boschmann-softwareentwicklung.de header.i=@boschmann-softwareentwicklung.de header.b=bk2zz6ku; dkim=permerror (0-bit key) header.d=boschmann-softwareentwicklung.de header.i=@boschmann-softwareentwicklung.de header.b=FtS7fSiI; arc=pass smtp.client-ip=85.215.255.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=boschmann-softwareentwicklung.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=boschmann-softwareentwicklung.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=boschmann-softwareentwicklung.de header.i=@boschmann-softwareentwicklung.de header.b="bk2zz6ku";
	dkim=permerror (0-bit key) header.d=boschmann-softwareentwicklung.de header.i=@boschmann-softwareentwicklung.de header.b="FtS7fSiI"
ARC-Seal: i=1; a=rsa-sha256; t=1747398377; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RwKQqZBk1TrOU8QKnMKE9hFOkScGKMMLameyTFIge6rHxpMaHsWM+EXySBRKBOJvKC
    2d3U8Od6hc4Wfpc5dy3YhePlQIPwu6zN9qLSF7XBA96sjs/ds1BL+Jsp9X6Ajma0ZeoJ
    BTvcI+I1oFAKJsyWKLD7XsbSjzAv7SVPOsUbdhUML3gorcFIgHyFwyf1EDg4F2/fdARx
    rCCzq/WkvQTL5f2A2eHiEK3JrPmGoZbSFRb122NPWpU3vDetfeg6VrkYiooyMd73w0Qd
    uXdoTbCDXFfV89FRf79TFjBNraZjQ+gm83H9Dfojo19DGNlxhrJJdbC2vSfjLRgsTnNI
    xfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1747398377;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=P4y55x+q7IjZFb4vrtUkVj3bGHkfVsdaB/NphaumMAA=;
    b=keC4DKZ3J85bOpQMosjGLz0Ho0EenI2HZ/YnpXOLfSXuPCmR8wZzXNmLjaV+1kbMvO
    nYMbnDQdjmW0PXaELvemdChFuHv8AhulsSTmSXcdfrZqW4iF2S99e+hV+coi68SKbRPF
    Wn1Boaecs8LFRZts2ZOfEMJ7xpZQnfjWW065M3EBXk8WwLKcTFiqrBB0UZDZ0WZjRhv4
    R6ceGvYGqvkf5Ddfu7beuq3SIzvWLpHrYI4wWYhCAl5Lzn0Od6ZuCVTmhjA7ezFynYin
    vEw8t/dAdF5AszI7Mlz6hUWaZcgWdSSPOOaEabgxjCrNw0nw5/+ndQDx4SSIHnJVpX2e
    /pug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1747398377;
    s=strato-dkim-0002; d=boschmann-softwareentwicklung.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=P4y55x+q7IjZFb4vrtUkVj3bGHkfVsdaB/NphaumMAA=;
    b=bk2zz6kuJ9Akk6BwWshQHXa32+EokJF2fd337kohDD1OfNGwpm/wj6KjJ2YfFPMyjW
    IJGzpxwZpfG5a1cOAz5tszoP+WWWfBHrDVDuKdayowA5lwwg37XayVTgJf65qGcQkabc
    vC6AL70fn7xbiMJS2d4HFDFZkXNHba9zlYl5scAY+lk/BcVfK1Yc4VGiZC+ugWHdEBst
    RWS4Z2JxEKB4Ni270uuVn2z3VVldqcpdgm2cLQsDCcaxLHT08bednrkc8nQ6vDjDobzg
    iMaz0hc58zGG9DeOMhDH0hlfsUysCZ/cfsU4aqiVlLMIsy8SvLZhhq3xHCI4S4c1Z6PC
    0eTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1747398377;
    s=strato-dkim-0003; d=boschmann-softwareentwicklung.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=P4y55x+q7IjZFb4vrtUkVj3bGHkfVsdaB/NphaumMAA=;
    b=FtS7fSiINuFbunW0iGgRtj5udelsfjblI6lxrg1648/tdJMeeSi2t/kNaoPlV41wNj
    Zi6+aMeklualzHviXuAw==
X-RZG-AUTH: ":LmMXeheIefCMSMahdBN89VYePWs33GUVKLsfwIEt0MQE94uzFHq+Z8XqBWe4TSd4LUucwMbt6UIULo4ulygZZcLfzKzAJsAWQZXS9Vwb3jZfjtRfKk+j61scQDQ="
Received: from [IPV6:2003:c0:2f3a:c800:6f3:cf50:4f68:badd]
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id I55e4a14GCQGSfM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 16 May 2025 14:26:16 +0200 (CEST)
Message-ID: <897fb106-26f9-43bc-ae47-a02841aa9f3b@boschmann-softwareentwicklung.de>
Date: Fri, 16 May 2025 14:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: alsa-devel@vger.kernel.org
From: boso7 <boso7@boschmann-softwareentwicklung.de>
Subject: [Question] Sound card implementation - only codec to codec
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I'm working on an ASoC-based sound system and would appreciate input on 
how to properly structure or
design a sound card.

The project is a media player / sound system device. The CPU doesn't 
process any audio itself — it
only configures and sets up the hardware. For example, it starts the CD 
player (via I2C, not as an
audio playback device of the CPU), which then outputs SPDIF to an 
SPDIF-to-I2S converter (AK4118).
This converter then outputs I2S to two DACs (PCM1795). Other modules 
follow, but this part of the
path should be sufficient as an example. If I understand how to handle 
these parts, I can apply the
same approach to the rest.

So the (simplified) audio path is:

CD-ROM (SPDIF) -> SPDIF-to-I2S converter -> DAC -> Speakers

The SPDIF-to-I2S converter has an input mux, which is represented in the 
device driver as a DAPM
widget:

static const struct snd_soc_dapm_widget ak4118_dapm_widgets[] = {
     SND_SOC_DAPM_INPUT("INRX0"),
     SND_SOC_DAPM_INPUT("INRX1"),
   ...
     SND_SOC_DAPM_INPUT("INRX7"),
     SND_SOC_DAPM_MUX("Input Mux", SND_SOC_NOPM, 0, 0,
              &ak4118_input_mux_controls),
};

static const struct snd_soc_dapm_route ak4118_dapm_routes[] = {
     {"Input Mux", "RX0", "INRX0"},
     {"Input Mux", "RX1", "INRX1"},
   ...
     {"Input Mux", "RX7", "INRX7"},
};

A few additional notes about the use case:

- Ultimately, I want a single mux to select between inputs (CD, 
Bluetooth, Tuner, etc.). The outputs
can be enabled/disabled via switches. Both the mux and the switches 
should be controllable from
userspace.
- I’d like to avoid the need to start streams explicitly (e.g., via 
aplay). Ideally, when an input is
selected, the audio should begin playing immediately (I think I haven’t 
fully understood the concpet
of streams..)
- As far as I can tell, I’m only using codec-to-codec connections. I 
think I understand how to create
DAPM paths, but I’m unsure how to achieve automatic playback when the 
correct source is selected.

My questions:

1. Is the way I imagine my sound card feasible? Or do I have to do more 
from the userland?
2. When I select an input (e.g., CD), how do I get other DAPM of e.g. a 
codec to change? For
    instance, selecting CD should set the input mux of the SPDIF-to-I2S 
converter to INRX5.
3. In other drivers, I often see codec registers being set directly. Is 
this really the preferred
    approach?
4. Again, I want to avoid using something like aplay because the music 
is always played
    independently of the CPU. I just need to set up the hardware 
correctly (input mux, DAC
    configuration, GPIOs, etc.).

I hope my use case is clear. I’d appreciate any tips, especially 
pointers to documentation or
example drivers to investigate further.

Thanks in advance and best regards
Manuel Boschmann

