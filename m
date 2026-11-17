Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897857;
	b=ruEYzoPIh2X7FU11u8w3nhay6c9hQf8t5BPIrhJfzdlyJkOo0lqaH82w80JH2R2mj17X
	 VpUzKTWV8SmOrhfR6V6ejK+EuVQevpUXFoYek5DQzz4lmzqaiMj2Nd+zfDgdU1teR779l
	 rJmLG8/9RaPbzs20rSBIdmqbfWLjbAOLsCvC0h3kpycREuwn6ofQJooZwAYmqAktpGip4
	 5p46uoCg83yBYEyv5harem/zICztYfttSYJe9qfSmYKmQ0ptt+BKiUuxZ5Jr//Tx5/Jlw
	 8eZGNhcZNhl/2wIkiM0W6N7FoHwHJ/GJIejEiqkqAH7zaL43fN7Sl6x8lnL1C3EdAmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
	b=naOcwR4P6ueGB3GVcIHDjKIsEoZXZU/5fAe+loHU9LfwzDT3YVSqlWHDSMSlMAqMcJEt
	 IHh3lCO5xn92KdgWY4G7c759dJmfmckN+ZUyit/5t+Im/gvO2MXVgQvPHrKAhZKuZOlDi
	 kxA2ZH6aQPjJqIkiIKucoxmns1Z1/AOl8Ru+SZ9EIereYqiqmXja+jeolBt9IEyeyHSpC
	 taDdityqFKC1o587NLHbtUqvt3jKYL5JWeHdVtUhqVAeUmuwEmgvH3sLln4TigOwQWJ4t
	 N6B9Af39xNcfdemh5COFdHUHGaWUl1awta1D6gtDyfBUm+f728BsU8zf6fNtitlvrvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EigEqq1B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD4606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 06:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EigEqq1B
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso526571f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 22:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897856; cv=none;
        d=google.com; s=arc-20260327;
        b=dLbwojvfbGeHWFs8eS8k+SuAESE23k7WRLCNCfWF1JkO2trEWWnD7fXjjGBgD1DA/y
         rW1sCGY8lY5KFW07xtHr/tNGrr6PFY6tajO7Oz1gghTMha3rTabIzGe95gHcBucHhHMp
         zMaltZNN2+hfukOL98q7rUlDGZZ1IS4O0TSwc5N9TePIB1TbL02xne71jeNs4puNF/nB
         5BSmCD2qTvHXdOW533bncGygRIEbsWx95dV4akVvmic/79eVDSFNN+M3D9j2r6wttZYk
         jNyWj6oE7CFacBwVRlS5afvHVk33RDYmJjRYYC4spPex0AfVtv2niIXt7FNsrHC4n/sR
         qhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        fh=5RKHo3KAIQpCwQnc70JrF5Q3LdPaIOCqasiTesydqWc=;
        b=b4bkO7+rmwDwUHUp6n4ulHU7vr7JTGuW9fZg3KFz4KEleKcLUtOp5fzqjRWUIgVR6m
         VQcDWuGV5tldhdR6rpsQ9gmiA2/uE091ZtohVLgnwLMwPJca1TOBb16wPQRSXlUEPTT4
         ImyUARzk5/tbTqYU/YYXiXI9HZFKQWoM+EZk3spL+J/H+jlYR/bqOy7QJhGXcF1iaPRk
         p7m8mJjdxIaO6buCaJCLMx/Hg+tyctK5Spf/XhVmSMehlHtedIVmM88yTB85PMejKHEA
         jWcJ6HKFu0BZngw9R4ybJfN3NO7JGAr49YRuVsCSx81tUMFBCPBteuCp82sHW+PSnL9W
         qQfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897856; x=1795502656; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        b=EigEqq1BqBN+1gG+Pzt7egI1ia+zosHBuobd0OTg3LEvkZEyLJBWCExu4SBVE0XC1j
         ZENn3LOFmqaPL5hSsyTNg6Dr10Wg6f2hkK6zEQL3HmgohJ9uGw9Aes+r6y+h+cSScQaf
         NKvTfCo/A9xlg6c+Zy6REo76/tw8Cs6eMBsfF9lorLWTnCqEgiaLCJLcfBI0lWSHJoFl
         KOzYPiljOmoswMFpvgTnWRc3YoG6fpMajE32qVdW9bSNyIFFq6tu+ycqyxwcVyw4C6G2
         NUjFC/cJ/qkq0cq3+Wbm65Pz8m50SxV4he8Lt3VfoplUy7IswyTDnUJdYJX7oh59wgu6
         bFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897856; x=1795502656;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        b=qpnYBEz0D4KCZcH/+Dw2C4uWnMa0Txk1sj6U/Hmuhta08e0AYyQSDnpvZwp0wd7GTL
         n9TSNU1UxeuxakJ3LZC3IAnUi35MdXWMdyN3zYDj9VqJPKQCVEzKypbDYG9IEI4jGqkh
         Co9bhtkh0aC1++lAy89UDPpCZPbjeg7cetLAlVUOYz0C+fzUYN+Sz0lVNPxig1UBx3Dk
         2EaCxcXQyZg4V/eVdpYpAbVBVVXA7iOXVsZmHX0JIz30nz/TrOnDklxe5lO3aTz6fqxL
         pSOYUd5O5Bmt2FBHLuU3tPnht/wpFbFL7+m0oS8oOV/z1Cyuwq11Y8RgX9sxFkMudRvF
         cC6A==
X-Gm-Message-State: APuU4Z9ABsWzK0ukT/WCPiUpi96SlDTLua1TmoscF6O+xcKkpMsVChBg
	LUgGENEd6tHxrLdSzZySKg1T8s7dSJBmuGLNBuBj0IyuPvcg9WVDgijT1d7b6FGIQKzl9sLj70Q
	ner+5VQLxFz26bR2ImjXWscQbwncWCHA=
X-Gm-Gg: AZFdTZcfFcCLn1iCWYAnZfnim6zZO9kNjQAqkfd4/8EzVqYVg+0COFphr0nKP+YOT8E
	fMh2BdwB7rn25NMmNGCaywo9+Qx7OlhZYGGoseSSjbyxvJZWrj01QByoVrLgUS0SNc474qSUz1X
	usBQWiTyIwv7OZea4lcYv3EnH0xQQAPEI+N2XzR4V0VapIFsecK4KvHeYBEBilpM+VZKiuGfhU/
	dh9fDCkvCDwPiUo3Y5Ox5qAMDZwOgNzHS++fX6gHoIxcOd2wtFNCXGvdobx+ZVpSMqTBt6EhZkd
	XHk/5clY1IkzbGmj/r36qungGxmH6aUeysYZdHuH5VhQV4xcEaTY2oDxgTiAxoE/HFa6vHnF/Er
	eilEkAz5BLJacdHQrkFFLV07/M6RSitdjvaZM
X-Received: by 2002:a05:6000:4213:b0:493:8c32:94 with SMTP id
 ffacd0b85a97d-49c726db093mr25624978f8f.38.1794897855591; Mon, 16 Nov 2026
 22:44:15 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Michael Coppola <m18coppola@gmail.com>
Date: Tue, 17 Nov 2026 01:44:04 -0500
X-Gm-Features: Aa3M54rZvG_hjBAGbc245IRPke91uDHwnm-RbxPY2q3kxJVoy6ojn3PTwbrEgDU
Message-ID: <CANWVVqiK1i8aduXKxEihCUNhNgw=OsPEP1MNAzpRpKhvgqa7og@mail.gmail.com>
Subject: [BUG] ASoC: tas2783-sdw: 3-field vs 4-field firmware filename
 mismatch on HP OmniBook (8EA1-8EA8, etc.)
To: Baojun Xu <baojun.xu@ti.com>, Mark Brown <broonie@kernel.org>, 
	Niranjan H Y <niranjanhy@ti.com>, Kevin Lu <kevin-lu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Baojun, Mark, and all,

I am testing an HP OmniBook X Flip Laptop 14-kb0xxx (Intel Core Ultra
Series 3 / Panther Lake, PCI 8086:e428, subsystem 103c:8ea4), which has
two TI TAS2783 smart amplifiers on SoundWire link 2 (UIDs 0x9 and 0xC)
and a Realtek RT712-VB on SoundWire link 3.

In sound/soc/codecs/tas2783-sdw.c, tas_generate_fw_name() formats a
3-field firmware filename:

    scnprintf(name, size, "%04X-%1X-%s%1X.bin",
              pci->subsystem_device, bus->link_id,
              fw_uid_prefix, unique_id);

On 103c:8ea4 (link 2, UIDs 0x9 and 0xC), the driver requests:
  - 8EA4-2-0x9.bin (fallback: 8EA4-2-9.bin)
  - 8EA4-2-0xC.bin (fallback: 8EA4-2-C.bin)

However, linux-firmware (commit 43cc9de7, "linux-firmware: Add firmware
for new soundwire projects") ships 4-field filenames that include a
speaker vendor ID field (<SSID>-<spk_id>-<link>-0x<uid>.bin):
  - ti/audio/tas2783/8EA4-0-2-0x9.bin
  - ti/audio/tas2783/8EA4-0-2-0xC.bin
  - ti/audio/tas2783/8EA4-1-2-0x9.bin
  - ti/audio/tas2783/8EA4-1-2-0xC.bin
(and similarly for 8EA1, 8EA2, 8EA5, 8EA6, 8EA7, 8EA8, 1954, 1964, 1994,
1AC4, 1AD4, 1B04, 1B94, 9013, 9014, 9015, 9026).

As a result, request_firmware_nowait() fails with -ENOENT out of the box
on all of these boards unless the user manually creates symlinks in
/lib/firmware (e.g. 8EA4-2-0x{9,C}.bin ->
ti/audio/tas2783/8EA4-0-2-0x{9,C}.bin).

On HP systems, the speaker ID (0 = AAC, 1 = FG) is stored in the UEFI
variable HPSpeakerID-c49593a4-d099-419b-a2c3-67e980e61d1e (as ASCII '0'
or '1'). Should tas_generate_fw_name() read HPSpeakerID (or fall back to
"%04X-0-%1X-0x%1X.bin" when the 3-field binary is not present), or how is
the 4-field filename intended to be resolved upstream? I would be happy to
send and test a patch for this on 8EA4.

Thanks,
Michael Coppola
