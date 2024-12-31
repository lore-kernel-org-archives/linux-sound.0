Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAD1ACEB8;
	Tue, 31 Dec 2024 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735670673; cv=none; b=Fd0xZl29K80yWhm5hqmnlWbgE68wWtDb0tXniyHLd6iiLhwb6Z6leeHACJja8/3TQ0l0vfJ0X2xu28HOgsRTgp14EI5QSGvCYIBvQOEq5/fXk1KUarJUH0YWrxOcOoM7Id5SnmqV/JwBHlDFFSIjnnKZCmHcM0l+7vRslS4+P6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735670673; c=relaxed/simple;
	bh=GZmHbEywkh+T4AaS2osYF2FBNuq2j3qC3zbefBSNVrw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RKWfck2wrrUC93yKo5nHHNTpTQmYN7MhaOWblixfKvtc5WncSiBgQOwVqChd6MpZoczIf9gqRFYwnPK3Lmk+ZS57dZy5vbN0XDLM4wbuYl8exZ2uARQVBBPWBVKYUX3L5U6WorrYCudtKJP82uTKnG2PER8XvaKMWRB5rZLVHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=GDWcKmmP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GDWcKmmP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so117930435ad.2;
        Tue, 31 Dec 2024 10:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735670671; x=1736275471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rx/BAtYz+YSmLVs6o5kW+gu0D5xRt+OIkNVnblY2Dys=;
        b=GDWcKmmPtZevr+8XTKhCT+nrcmd7DqFJOUc1gI4A+w49viBqUFgZUlVRXHsn73zhGD
         Jn9fPGoV4UpMVy7AkIb3SiacR1J3ixcZDlfIfetC5u7urEQdVPxd3a4zQNClkHl3a4Lp
         6DeJtRkpGjqGTGqu7M448Rh3vaS9u/gtKGk5ViRzA0HvRuI2iX+TqW9d1F+GCK02p2hV
         IgZF+YDwgZrem1a3SpG2SGGfTkKg9HCn0iJoycIR0Tt7q8s65hVY57RHHGHQcwNck8ag
         GHi2qdkv0etsxDcVuFO2mfTNLjMxGPok0UoBIcLSvMtiIYX5ulz7y5923aN9EvM7ymmg
         g/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735670671; x=1736275471;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rx/BAtYz+YSmLVs6o5kW+gu0D5xRt+OIkNVnblY2Dys=;
        b=JwhRbPJKWdHv8USnCI/GFWmrWdQQk8tcnHvGReEIhG/ksV5ILxpHBsOYBDFS6XZMhZ
         B4zIJcE7cuP5xN2segszG1lyfgH0aUspDGzwRpXlf+eIyCcL10QHz2mY+ysZy6EZ4Ad0
         OtDtQhewzYK3CRPOiW0xRs754hR/iiDhVHWFIH0CgqZCVWI/kJAhobDgfPoaWIDygLSd
         BZU7CdG7Y6CRNBus6tuoIqouj06OhxQkzaztIpc+sS/d3NimHwJY1R6f/JsM3ASCaaH/
         G7pNwVlAMadBwT7vsB7vh+0Fvf7eD399hh4qPF4csn8elXGHa0v/m1smls5dklVZRwRJ
         mFag==
X-Forwarded-Encrypted: i=1; AJvYcCWIj3b3kqLwx+BhEJmj6fTh2IuKJjUfcQ6yT93tUWYNaVxx/JDsibZLDZYlDH8dGbPsVsD++ZQSfnJ22VY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYuKA4uS7EZskCmpoNunrEClNMUNo3KsCKyfjq1GHRmAqQYO/
	X2bMo6Kh7aOQOM52NmvuNSvqnveS+BKw3fpwFYsoupoep6jBFWkYfo/+Mnuzu7Yft9Jl80esJOn
	Yx8PtguTIAozjlwitKnYibouyxe0=
X-Gm-Gg: ASbGncuJjN671lP5TiUv8rE+njU0rrLqZ4CDaya1L2rqgF/03NsLX6fa2AROd5XzyRM
	kKFofutOSvlCgMiBMAXVnmf4Ph2XUck/iI2B+66eYzpCCivLV2703JYDil4F30oerOzbM3vY=
X-Google-Smtp-Source: AGHT+IH0eYkv9jMWnNWk5clNdXDiJhTdGXywUxzL8uXyNgWAEqJCW8pgacoyM8OKkm7iaQpFDbJb+dG7SSGKuIkyu6Q=
X-Received: by 2002:a17:903:32c5:b0:215:bb50:6a05 with SMTP id
 d9443c01a7336-219e6e894f4mr583339975ad.9.1735670671350; Tue, 31 Dec 2024
 10:44:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2024 19:44:20 +0100
Message-ID: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
Subject: meson-aiu: HDMI codec .prepare() callback not called
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Content-Type: multipart/mixed; boundary="000000000000d03d17062a955188"

--000000000000d03d17062a955188
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

I am still working on a HDMI controller driver for Meson8/8b/8m2.
HDMI output would be incomplete without audio.
There's a great series from Dmitry [0] which simplifies the HDMI
controller driver implementation by moving all the hdmi-codec related
management to a generic framework.

I tried integrating Dmitry's work [0] into my HDMI controller driver.
While testing I found that hdmi-codec's .prepare() callback is not
called at all and asked Dmitry for help [1]. All other callbacks
(.hw_params, .startup, .shutdown, ...) however are called.
On his board (Qualcomm SDM845, sdm845-db845c.dts) hdmi_codec_prepare()
is called by snd_soc_pcm_dai_prepare() (core sound framework, not
platform specific).
However, on my Odroid-C1 this is not happening.

Looking further snd_soc_pcm_dai_prepare() I can see that
for_each_rtd_dais() has three entries:
  snd_soc_pcm_dai_prepare(), dai name=I2S Encoder, id=2
  snd_soc_pcm_dai_prepare(), dai name=CODEC CTRL HDMI I2S IN, id=0
  snd_soc_pcm_dai_prepare(), dai name=I2S FIFO, id=0
What I'm missing here is a dai name "i2s-hifi" (from
sound/soc/codecs/hdmi-codec.c, see hdmi_i2s_dai)

My hdmi_tx node looks like this (abbreviated):
  hdmi_tx: hdmi-tx@42000 {
      compatible = "amlogic,meson8b-hdmi-tx";
      reg = <0x42000 0xc>;
      #sound-dai-cells = <1>;
       ...
  };

Then I have a "amlogic,gx-sound-card" instance with the following dai-links:
  dai-link-0 {
      sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
  };
  dai-link-1 {
      sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
      dai-format = "i2s";
      mclk-fs = <256>;

      codec-0 {
          sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
    };
  };
  dai-link-2 {
      sound-dai = <&aiu AIU_HDMI CTRL_OUT>;

      codec-0 {
          sound-dai = <&hdmi_tx 0>;
      };
  };
So apart from the additional cell in the sound-dai towards hdmi_tx
(Meson8/8b/8m2's HDMI controller has two inputs: I2C and SPDIF. I2C is
the first one, hence &hdmi_tx 0) this is identical to
arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts.

I have further verified that the gx-card parsing does find the HDMi
controller and links it correctly.
To me it's odd that only the .prepare() callback is not called, all
others (as mentioned above: .hw_params, .startup, ...) are working
fine.

I'm not familiar with the sound stack and I'm hoping that you have
some ideas on how to either debug or fix it.


Thanks in advance and best regards,
Martin


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/dri-devel/20241231004311.2574720-1-martin.blumenstingl@googlemail.com/
[2] https://lore.kernel.org/dri-devel/l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6/

--000000000000d03d17062a955188
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff"
Content-Disposition: attachment; 
	filename="sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5ctggrg0>
X-Attachment-Id: f_m5ctggrg0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2hkbWlfYXVkaW9faGVscGVyLmMKaW5k
ZXggYWEzYTVkMDMyOWRjLi4wNWFmYzlmMGJkZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kaXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
aXNwbGF5L2RybV9oZG1pX2F1ZGlvX2hlbHBlci5jCkBAIC0xMjksNyArMTI5LDYgQEAgRVhQT1JU
X1NZTUJPTChkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fcGx1Z2dlZF9ub3RpZnkpOwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fb3Bz
ID0gewogCS5hdWRpb19zdGFydHVwID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3N0YXJ0dXAs
CiAJLnByZXBhcmUgPSBkcm1fY29ubmVjdG9yX2hkbWlfYXVkaW9fcHJlcGFyZSwKLQkuaHdfcGFy
YW1zID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3ByZXBhcmUsCiAJLmF1ZGlvX3NodXRkb3du
ID0gZHJtX2Nvbm5lY3Rvcl9oZG1pX2F1ZGlvX3NodXRkb3duLAogCS5tdXRlX3N0cmVhbSA9IGRy
bV9jb25uZWN0b3JfaGRtaV9hdWRpb19tdXRlX3N0cmVhbSwKIAkuZ2V0X2VsZCA9IGRybV9jb25u
ZWN0b3JfaGRtaV9hdWRpb19nZXRfZWxkLApkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9o
ZG1pLWNvZGVjLmMgYi9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYwppbmRleCA2OWY5ODk3
NWUxNGEuLmE5MzFkMDViYTg5ZSAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9oZG1pLWNv
ZGVjLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMKQEAgLTU3MCwxMyArNTcw
LDEzIEBAIHN0YXRpYyBpbnQgaGRtaV9jb2RlY19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vi
c3RyZWFtICpzdWJzdHJlYW0sCiAJfTsKIAlpbnQgcmV0OwogCi0JaWYgKCFoY3AtPmhjZC5vcHMt
Pmh3X3BhcmFtcykKLQkJcmV0dXJuIDA7Ci0KLQlkZXZfZGJnKGRhaS0+ZGV2LCAiJXMoKSB3aWR0
aCAlZCByYXRlICVkIGNoYW5uZWxzICVkXG4iLCBfX2Z1bmNfXywKKwlkZXZfaW5mbyhkYWktPmRl
diwgIiVzKCkgd2lkdGggJWQgcmF0ZSAlZCBjaGFubmVscyAlZFxuIiwgX19mdW5jX18sCiAJCXBh
cmFtc193aWR0aChwYXJhbXMpLCBwYXJhbXNfcmF0ZShwYXJhbXMpLAogCQlwYXJhbXNfY2hhbm5l
bHMocGFyYW1zKSk7CiAKKwlpZiAoIWhjcC0+aGNkLm9wcy0+aHdfcGFyYW1zKQorCQlyZXR1cm4g
MDsKKwogCXJldCA9IGhkbWlfY29kZWNfZmlsbF9jb2RlY19wYXJhbXMoZGFpLAogCQkJCQkgICBw
YXJhbXNfd2lkdGgocGFyYW1zKSwKIAkJCQkJICAgcGFyYW1zX3JhdGUocGFyYW1zKSwKQEAgLTYx
MSwxMiArNjExLDEyIEBAIHN0YXRpYyBpbnQgaGRtaV9jb2RlY19wcmVwYXJlKHN0cnVjdCBzbmRf
cGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCXN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyBocDsK
IAlpbnQgcmV0OwogCisJZGV2X2luZm8oZGFpLT5kZXYsICIlcygpIHdpZHRoICVkIHJhdGUgJWQg
Y2hhbm5lbHMgJWRcbiIsIF9fZnVuY19fLAorCQl3aWR0aCwgcmF0ZSwgY2hhbm5lbHMpOworCiAJ
aWYgKCFoY3AtPmhjZC5vcHMtPnByZXBhcmUpCiAJCXJldHVybiAwOwogCi0JZGV2X2RiZyhkYWkt
PmRldiwgIiVzKCkgd2lkdGggJWQgcmF0ZSAlZCBjaGFubmVscyAlZFxuIiwgX19mdW5jX18sCi0J
CXdpZHRoLCByYXRlLCBjaGFubmVscyk7Ci0KIAlyZXQgPSBoZG1pX2NvZGVjX2ZpbGxfY29kZWNf
cGFyYW1zKGRhaSwgd2lkdGgsIHJhdGUsIGNoYW5uZWxzLCAmaHApOwogCWlmIChyZXQgPCAwKQog
CQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1kYWkuYyBiL3NvdW5kL3Nv
Yy9zb2MtZGFpLmMKaW5kZXggMzRiYTFhOTNhNGM5Li4wMzBjNTczNzUzY2MgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9zb2MtZGFpLmMKKysrIGIvc291bmQvc29jL3NvYy1kYWkuYwpAQCAtNTc3LDYg
KzU3Nyw3IEBAIGludCBzbmRfc29jX3BjbV9kYWlfcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJz
dHJlYW0gKnN1YnN0cmVhbSkKIAlpbnQgaSwgcmV0OwogCiAJZm9yX2VhY2hfcnRkX2RhaXMocnRk
LCBpLCBkYWkpIHsKKwkJcHJfaW5mbygiJXMoKSwgZGFpIG5hbWU9JXMsIGlkPSVkXG4iLCBfX2Z1
bmNfXywgZGFpLT5uYW1lLCBkYWktPmlkKTsKIAkJaWYgKCFzbmRfc29jX2RhaV9zdHJlYW1fdmFs
aWQoZGFpLCBzdWJzdHJlYW0tPnN0cmVhbSkpCiAJCQljb250aW51ZTsKIAkJaWYgKGRhaS0+ZHJp
dmVyLT5vcHMgJiYK
--000000000000d03d17062a955188--
