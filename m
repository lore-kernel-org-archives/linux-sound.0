Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C83DCDAB
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928131; cv=none; b=MViXyXIfEStQsFKWcr4SHo0aUbV1/oxKWqvVHyaifCDHIxxH5fuXOD/1Wi3imCfi1YwK3Uy5q+4Sa2xbKqSAvEBOwDSauqecJPe3FSfoiAEMzuFRtMkukWSMWCvOUQT3UrlZKXKV9oqAL8/6D5KbM1x0OlgNLR/gkZXu1HkB5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928131; c=relaxed/simple;
	bh=9R7NbaHdt+swhYIqwPSi6bL9GRAa5elUJvUsQk6jZQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4FMnlPo14vWW9MPb5NgCtKDSESCFP3iJkqtiIfZeoEhPPQbqchsp/AYZJ33WBRFo38uLF/jtB6o1yS13KF+bHmXLZV0LJx3Mk3UtigfNhh8VOA9TR4/xmrCJWiewRdA5SwBwGQNznAm62aiuI5AvsuBTm4Ikt9Y1HKTBSW4Uqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHNtROpm; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHNtROpm"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a74765703so60399027b3.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 00:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928129; x=1777532929; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCMCaBnsAn633amphw1lDT95b4RQPKxvb2V6XNZ7tQ4=;
        b=eHNtROpm8o6iz8qU3fTTe/juINSCKqyUGB1jAFXCr+CGqRRTfeJBVuK/D824i9vn4j
         jSnbIITcJkV6F29MW1GKRpoimcv1MfPRySMyqNnBJZ+q3gqCSdB78pQtdtN2dSDLc98c
         UUfoSt42njrgbnrQGHLGxWufIc9rheWdrliIOqkuB17KHMRVmqOdcaPunBSlWi4g31bF
         C4Zt1tXRic2Wtv0lzyHEPyuC/wkIuWuuQLv3QQPK0+SpoqMOS+XC0wuqruPdN0QuP2V8
         r9onmC4stknmDqZuwdzH22LkRFSi6CpUxz1x2OdVIgEXJjS3T3BB+DZxzdAU/IUDYU/6
         cQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928129; x=1777532929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCMCaBnsAn633amphw1lDT95b4RQPKxvb2V6XNZ7tQ4=;
        b=RzmwgStxtu5jMIkUkfETgRlRkREUPhYYzrdsZVZzpA16XeCBdeHuJp009qKKY1hwtU
         8SzcsuC/3yNURlhNXVkG2n4IWZxBm9K1s88EZbPsyCGYpp/5zDLkH6/GVdK2NjXlgqYj
         enPAU+kVHIedZMZdArD/99MjVt3uin2hiOexIlLa38eRMc1SL35yd1WPpypfuO9Zo7iA
         q+qqkz504AS1n4fKoeJfkEW/1TNtkVjtEXuebvsWdmo22zXkSFFtr7WhIDctJch0vZfR
         p0pUi8k1h9kLnYDyPZVR1+nrFvtw/y1GFGssvWXuxrOxP3QvEfeqkgwwLKESB9VZQaG8
         3Zew==
X-Gm-Message-State: AOJu0YwpwAf39wtDArxrT9PxYOQ4m47oCRhfnUSyEusf3IEkNCiLUreB
	8pAKG+3UpkethWfFZOA1Wlfd19LtiDwUsvl91bpvvTzzg6q32PzPJLI6l3wOFpW4
X-Gm-Gg: AeBDiesC03GwUK6035QVWuMZZIn2RGjEergR8enYc3UaXxyX9LJiIcO3eW2RzBr2bEn
	BP3kaLaqV+c9T5WA3OdrgMAKnIxwBdts40Mofgq+N2xUfHrl0JOq/ZuiA1V/Ks924HXhTsVfnRX
	ErDtSuUdxeQitQHMDNwCEOHrF1l9BpuDmQ5lNuizE3Bc2FdpgAnaz09mZgZDJnfIcydSpNDSN02
	gYKp+2UWvwT77cZVeG/RlpDHsuAwqRtmbvlEHRN5z4xllXS1vfHZUU4oBJANgZo1xu13e/8OTzd
	IUsJNJbQ9urd6q4MfyjcyYQahbIDzAHf+P9dQ8OGJkdROeWS1UVxtKaBYaXI9fQqSFqzYW/iEZT
	IRGlEOmesmKDnHVINHo18xxdlahXKC5/RdifZu7KwEPkG+Qpw/EXiey4MuWqd4qbkju6s60l3KE
	jlKeolzNLjxztnf4FQ2eimU9MIoKM5M4Mr92t0Uok=
X-Received: by 2002:a05:690c:6c0d:b0:7b4:378c:f732 with SMTP id 00721157ae682-7b9ed0477e1mr264991747b3.46.1776928129175;
        Thu, 23 Apr 2026 00:08:49 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee99b672sm80171657b3.29.2026.04.23.00.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:08:48 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:08:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: hda: cs35l56: Add support for speaker id
Message-ID: <aenFesLAStjrVNy8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ It's weird that this is showing up now... - dan ]

Hello Richard Fitzgerald,

Commit 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker
id") from Sep 18, 2023 (linux-next), leads to the following Smatch
static checker warning:

	sound/hda/codecs/side-codecs/cs35l56_hda.c:1084 cs35l56_hda_read_acpi()
	error: uninitialized symbol 'nval'.

sound/hda/codecs/side-codecs/cs35l56_hda.c
    1013 static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
    1014 {
    1015         u32 values[HDA_MAX_COMPONENTS];
    1016         char hid_string[8];
    1017         struct acpi_device *adev;
    1018         const char *property, *sub;
    1019         size_t nval;
    1020         int i, ret;
    1021 
    1022         /*
    1023          * ACPI_COMPANION isn't available when this driver was instantiated by
    1024          * the serial-multi-instantiate driver, so lookup the node by HID
    1025          */
    1026         if (!ACPI_COMPANION(cs35l56->base.dev)) {
    1027                 snprintf(hid_string, sizeof(hid_string), "CSC%04X", hid);
    1028                 adev = acpi_dev_get_first_match_dev(hid_string, NULL, -1);
    1029                 if (!adev) {
    1030                         dev_err(cs35l56->base.dev, "Failed to find an ACPI device for %s\n",
    1031                                 dev_name(cs35l56->base.dev));
    1032                         return -ENODEV;
    1033                 }
    1034                 ACPI_COMPANION_SET(cs35l56->base.dev, adev);
    1035         }
    1036 
    1037         /* Initialize things that could be overwritten by a fixup */
    1038         cs35l56->index = -1;

We set cs35l56->index = -1;

    1039 
    1040         sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
    1041         ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
    1042         if (ret)
    1043                 return ret;
    1044 
    1045         if (cs35l56->index == -1) {

nval is uninitialized if cs35l56->index this condition is false.

    1046                 property = "cirrus,dev-index";
    1047                 ret = device_property_count_u32(cs35l56->base.dev, property);
    1048                 if (ret <= 0)
    1049                         goto err;
    1050 
    1051                 if (ret > ARRAY_SIZE(values)) {
    1052                         ret = -EINVAL;
    1053                         goto err;
    1054                 }
    1055                 nval = ret;
    1056 
    1057                 ret = device_property_read_u32_array(cs35l56->base.dev, property, values, nval);
    1058                 if (ret)
    1059                         goto err;
    1060 
    1061                 for (i = 0; i < nval; i++) {
    1062                         if (values[i] == id) {
    1063                                 cs35l56->index = i;
    1064                                 break;
    1065                         }
    1066                 }
    1067 
    1068                 /*
    1069                  * It's not an error for the ID to be missing: for I2C there can be
    1070                  * an alias address that is not a real device. So reject silently.
    1071                  */
    1072                 if (cs35l56->index == -1) {
    1073                         dev_dbg(cs35l56->base.dev, "No index found in %s\n", property);
    1074                         ret = -ENODEV;
    1075                         goto err;
    1076                 }
    1077         }
    1078 
    1079         if (IS_ERR(sub)) {
    1080                 dev_info(cs35l56->base.dev,
    1081                          "Read ACPI _SUB failed(%ld): fallback to generic firmware\n",
    1082                          PTR_ERR(sub));
    1083         } else {
--> 1084                 ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index, nval, -1);
                                                                                               ^^^^
Warning here.

    1085                 if (ret == -ENOENT) {
    1086                         cs35l56->system_name = sub;
    1087                 } else if (ret >= 0) {
    1088                         cs35l56->system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
    1089                         kfree(sub);
    1090                         if (!cs35l56->system_name)
    1091                                 return -ENOMEM;
    1092                 } else {
    1093                         return ret;
    1094                 }
    1095         }
    1096 
    1097         cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
    1098                                                                  "reset",
    1099                                                                  cs35l56->index,
    1100                                                                  GPIOD_OUT_LOW);
    1101         if (IS_ERR(cs35l56->base.reset_gpio)) {
    1102                 ret = PTR_ERR(cs35l56->base.reset_gpio);
    1103 
    1104                 /*
    1105                  * If RESET is shared the first amp to probe will grab the reset
    1106                  * line and reset all the amps
    1107                  */
    1108                 if (ret != -EBUSY)
    1109                         return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
    1110 
    1111                 dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
    1112                 cs35l56->base.reset_gpio = NULL;
    1113         }
    1114 
    1115         return 0;
    1116 
    1117 err:
    1118         if (ret != -ENODEV)
    1119                 dev_err(cs35l56->base.dev, "Failed property %s: %d\n", property, ret);
    1120 
    1121         return ret;
    1122 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
