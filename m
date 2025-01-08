Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C61F0E38
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327893; cv=none; b=K31hoqG0O+/7BPVjqvUChXMUebq2/7ewKyRT4AA+p0Oplx/qcKcWcc9XK+MdkE/W6Cd0Tj9KKyUytdBfZvnxnaCHEllet3sgQ8VIG01z2w5RVLmexkTzfHQOxckS3ALaQjozUoFmgJGS39Ob/CLyFrK4aTaOhMZwPZHjFik3RTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327893; c=relaxed/simple;
	bh=xPtUaHUVXrqLkZ1UQDF7oAyeY2v3rzNNxYeDlBPUy3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvjpnwAIElsFIV2ME15bxM8vlmeP0VbGdvAed3WPLMSnz8WXVUUk2Xx9Qx0vOpWn1qUCmV5yr3iNQ81Mg/kn/z8e1es14JQe7xhTxZsY7SjUWIJMB4J72c6GhUYLAPPBYOHLZgw8qNJ1J3QtJ3SWkTWtx75z3ibJpX4yFR+UBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtnMZ/Wh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtnMZ/Wh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso113571825e9.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jan 2025 01:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736327890; x=1736932690; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoBcXw9+1VC4l4L2JNY40bkuPEIFB1C7FahYz3e4ANg=;
        b=xtnMZ/WhroB1nHsoZ1gPLwSEdvCVGTzUcQG6wctga4H9h+oE7f6a/1U66zSZL1Vfbh
         jqyPYnnucyALHaOKOjWJjdDxvidFw1R/5rsdZ3D33Pp02So9I+bxNjIyTDEgRgvx6ccz
         GNvHztDg1hhPIpMusbc6ovWGxqgXjeVyunU2iHYPkofMxE8isOyw0RapRFJKmH6hWCmE
         5DxPgNd63okr/Mg01sHXma2ukYSFY0JBfv58Uw8IlUlGok0PA1DyYR37y6r0pjsPguh9
         act7owD1FVt67IyY0MO0vvt6yOEIWJyixh3nTLGh43cgrSvDZr51fGURwvzoSUi7QGuH
         BbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327890; x=1736932690;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoBcXw9+1VC4l4L2JNY40bkuPEIFB1C7FahYz3e4ANg=;
        b=QuJ5NjTydv07t9VgcK1UB9hBODwwJF1tgqdv4xqUXQpzZyDyFd5+TYS+qdEArTnebM
         R1FOsMbMemGd9O6aipx/AojajNdGiE/JsvVfBSiWs3fSO3/O2AcMruNF6iqSPBq+QRTS
         FBrcKvCn5Pmoc84WOSay+0slyCU5gUd0kEfVr0+t+mi7i9/TZqMZvGwsMMBBkIGs4j43
         4HGlSz7CsoYxU9YexVhWzT+Uj5xSixO8/S5tZdrBw9nX/E0INLCpQjZlAte86bqb76XA
         sReJuFB5Q5MSrd/VedXaxUP6jyxsv1zhS1awSZEbv8rStXJgK/c7SFqJAohu3dFHF0kD
         8IXw==
X-Gm-Message-State: AOJu0YwqizqlUcgXGkpHXgSiBH4fQr54eivopTx4CecYpBY7vlorEIAY
	eOpz14TGhWt2ktgoNWKvFJV4hE/eWpTwYjkPGbRXbpCcW4DAhx5t+v2WiIn86lhNANHNtXNUWak
	Q
X-Gm-Gg: ASbGnctMi3ZK/Wh/kuMAVmV+viS2/bR8ggpIgkyIB9YxYXsurBWPip/maEAOciaERIU
	gBIBkx9/Q4rNhCxrMXOxDb4ufPYzx1Rj5nCxP/jFTKIzkKLyYRoWwUQRhJyYdPmTH6jSl5fvKj/
	ImLJM5Z4cIdokfq+89d0e5cCnXaVyCDTeTnDN9VBAIolkd/2QbLM/baGziIpmvYpuHfzMbCTtqu
	EazKdpTu8GcS27qrmNh43N54MFFcsTC1QFv6KdAXdKQFA9zrb0W99dup6z3mQ==
X-Google-Smtp-Source: AGHT+IEbBbsOBD54xp4ype/JIiFhKFnmuRa/fTBCnMyW9B/PWJ97hfyarWphoZZ/YqshCMErBhQ/uQ==
X-Received: by 2002:a5d:5886:0:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a87356509mr1471119f8f.51.1736327889777;
        Wed, 08 Jan 2025 01:18:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1c0sm53314512f8f.77.2025.01.08.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:18:09 -0800 (PST)
Date: Wed, 8 Jan 2025 12:18:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for
 tas2563 projects
Message-ID: <35b48e3e-fce5-4681-9b4c-bd9e23338e47@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Baojun Xu,

Commit 6a451e2c5c03 ("ALSA: hda/tas2781: Ignore SUBSYS_ID not found
for tas2563 projects") from Dec 30, 2024 (linux-next), leads to the
following Smatch static checker warning:

	sound/pci/hda/tas2781_hda_i2c.c:146 tas2781_read_acpi()
	warn: strncmp() with weird length: 7 vs 8

sound/pci/hda/tas2781_hda_i2c.c
    121 static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
    122 {
    123         struct acpi_device *adev;
    124         struct device *physdev;
    125         LIST_HEAD(resources);
    126         const char *sub;
    127         uint32_t subid;
    128         int ret;
    129 
    130         adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
    131         if (!adev) {
    132                 dev_err(p->dev,
    133                         "Failed to find an ACPI device for %s\n", hid);
    134                 return -ENODEV;
    135         }
    136 
    137         physdev = get_device(acpi_get_first_physical_node(adev));
    138         ret = acpi_dev_get_resources(adev, &resources, tas2781_get_i2c_res, p);
    139         if (ret < 0) {
    140                 dev_err(p->dev, "Failed to get ACPI resource.\n");
    141                 goto err;
    142         }
    143         sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
    144         if (IS_ERR(sub)) {
    145                 /* No subsys id in older tas2563 projects. */
--> 146                 if (!strncmp(hid, "INT8866", sizeof("INT8866")))


What is the point of using strncmp() here?  It looks like potentially
the intention was to check:

	if (!strncmp(hid, "INT8866", sizeof("INT8866") - 1))

This code is 100% equivalent to:

	if (!strcmp(hid, "INT8866"))
		goto end_2563;

    147                         goto end_2563;
    148                 dev_err(p->dev, "Failed to get SUBSYS ID.\n");
    149                 ret = PTR_ERR(sub);
    150                 goto err;
    151         }
    152         /* Speaker id was needed for ASUS projects. */
    153         ret = kstrtou32(sub, 16, &subid);
    154         if (!ret && upper_16_bits(subid) == PCI_VENDOR_ID_ASUSTEK) {
    155                 ret = devm_acpi_dev_add_driver_gpios(p->dev,
    156                         tas2781_speaker_id_gpios);
    157                 if (ret < 0)
    158                         dev_err(p->dev, "Failed to add driver gpio %d.\n",
    159                                 ret);
    160                 p->speaker_id = devm_gpiod_get(p->dev, "speakerid", GPIOD_IN);
    161                 if (IS_ERR(p->speaker_id)) {
    162                         dev_err(p->dev, "Failed to get Speaker id.\n");
    163                         ret = PTR_ERR(p->speaker_id);
    164                         goto err;
    165                 }
    166         } else {
    167                 p->speaker_id = NULL;
    168         }
    169 
    170 end_2563:
    171         acpi_dev_free_resource_list(&resources);
    172         strscpy(p->dev_name, hid, sizeof(p->dev_name));
    173         put_device(physdev);
    174         acpi_dev_put(adev);
    175 
    176         return 0;
    177 
    178 err:
    179         dev_err(p->dev, "read acpi error, ret: %d\n", ret);
    180         put_device(physdev);
    181         acpi_dev_put(adev);
    182 
    183         return ret;
    184 }

regards,
dan carpenter
