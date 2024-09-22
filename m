Received: from sonic308-21.consmr.mail.sg3.yahoo.com (sonic308-21.consmr.mail.sg3.yahoo.com [106.10.241.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B46F2F2
	for <linux-sound@vger.kernel.org>; Sun, 22 Sep 2024 23:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727046537; cv=none; b=isPC2JkBLOWyWpch/G/FRn3BOo1QsY2d1pTnc4Uz5iIAph6IGGsncx+qRaiANTG34fCTGy3w2mQTCulwsgBO83moXzOgokiT8PlyEdbbacd7LKzw2QbmcFIbC2zCV0CN8LIvo9ZEcvZcXYNboPtSpffOEbRp3zQPGc3np1I3ZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727046537; c=relaxed/simple;
	bh=d2VPowojLvE6pIFJNTWiXJSjA8DovhDJFtzR9cLp9K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=YpElShnc4BKmeMa1V/wId8Q8J1jpVmgIoSxK7KZdxITJp3EPxShZXMYFgO9OcgEE8q30BMuCb45/7r/GbhFSTPUk0jxoWBms/dMQqx9OgqtdRxxlvYO0mrIRZmHueMKizsLUccaZrsMacaU7ubPMa/D0kbklA33PNgqab3GhhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com; spf=pass smtp.mailfrom=myyahoo.com; dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b=L0mjWXdx; arc=none smtp.client-ip=106.10.241.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myyahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=myyahoo.com header.i=@myyahoo.com header.b="L0mjWXdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myyahoo.com; s=s2048; t=1727046528; bh=NdwgXXN+vaZk8Zb8F01/IiMP/PymZkaowWVo3D+MKn8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=L0mjWXdxuvY9ESQTlJyQrWJYZSBq+RUSkHub78dAjVv9vQmFPb97p8UogwxEYWPpbQPpzDQgrrtXkGW7zMf3mtjqMEg3Z8mggUgnbDakSF4QgU178eDs0ajfHJMnYvN8Bik+3Nh60ec2OSOUyYXYFtQ5A2nGd/REVgPX7u/GKMuwkCPbQXM3lMH7yeBURxGHU86YBKR8OdUbs5vqlwNG3+MxlWlDhuLukLhW4D9oWAUkLdR2KYQHWwxWGSft6KDmOLuEwsQLM7ZSaxkbZ0UGuU9wZzX2Dm59y70lmCBVljSRKb/myfFfLncJmoTKlso2G8IBefZ3P3h5w7vX+m3I/Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1727046528; bh=EPMW8MecoQSvQ/ICRbQkSKVSi7GbzepOLeA4AHCt+IE=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=RkYjlcF+n7jh6/uTGrCCajXJQ6aQB55oB60CJW3KExdhEaKtkOjzDtQ7JpSf/OkqbTyXfM7Z0N+CjaWWCCLBtjUr7KOFz/DDgB/NIJEt9YDN/CH/MrMC8Fcw4a+OsSxcKsC/0k0K4Lyu/DebXtxs+VWQbv7TZs/Q2KWJ3XINiTLC9I4UgC4xkoReMBUyAtaIeyjRM5wtdNe7KSFjosfdBC23kzoBHUPbgbo5dSEnoqLa/yo3eE7Ctxqs2AY95AeyWWITtMba3S/7cf73TVN0IDW4IhlA8sMNlAPAfmej9UzswElA/tK2/M1Y7gHmRqO9kTnegEpTZBeBucIwOQxsgw==
X-YMail-OSG: mcCKfdcVM1k8rU5PHk8h.r1wN1mY1gQefdiU0geabbU88pf3AjbW8SCjxzbIdwL
 MpIlTl_9pshkBZpQBCTMKTgI54lH_i_0nA6aimjWhfzF6t72gviy.ymiI2vI8fLitgwx.wuDVMD3
 8qiRhaFW.GzaTQI6NN.aJj8QxWO.KjBtmfUvyHXQJnfuQpPXVI0iokdrw7u_JR8.9E0R3MaGeW9x
 9kdIja4uHDHEdilcVoUxkd0RiO5boMGiLY5YNgv0SMVx82KWW.z_y5oIhE8SP8QA1HU.O3KptkEa
 AYBS85.r54jwHFVYT_shGydKxj5qOiVLDE32kL8HRECdnswzSVoRod0ekjtTd_ruP.elbbT17U4r
 y6rHnbQVb56dLes6.96XQtieK0clDOWIQc5yfhMM29Mdde25rtrX3jm4LcRZuvslyxiXbZ_DGTtu
 K9B6poRNanA7eU1UltNCQ4hJ_TIRVoBTdqW0if5ks0WFcbsXvT6tm0wrmIPRnykaI1JQ2Md8Y4C9
 FhSlBkb1Y11Fdy7CQHILuLAvsrRnPxN19g1ESjyCITUc8JLcmB77E1_u8W0zr.W8X25yJXXwKDgL
 SgqA45jB.Q.YoqE6aO3Y9EUY2prMRVNlvDHpPMkLnFUrBuPxgvVJvL9luQQnVcijD2XTX9ulmcC4
 mD2855Jq9mP3OJ92XGNY5qKuzaBX62WpIlm9SthccKiH61AlOvRJ2enOGWb96NVygv1hD.Xqu99e
 NW29ecthx.4GXih6NUJVLfMAXekj0l1CMuVSkFHYuRBC7Wl2IoJqDgdepSFoYZ63ilfF63uyX1Io
 YrogjQ2BqX5y0QzGTRRMu_74RTtLsD2E4ibRin2KscmEITpBH6mSgtrci7wubo72pXBLVUc.VDHp
 0jYpssiI2cjL2nxS588oNx4WWrLR9AmZxeQaNSG.SezbvccjxZS9zkwojJw6z5YtPKMgiMBI8CKw
 K.iZDKzzwCxMAlzZAeUDetHBfg93TDyw8y2JpVuyPjey7T7uAwb1BR1ZwzoThtuy9h_9nGjKc.wN
 .OuTfFnSZg_J1YgmhYdO.RXdCn0_FyjIa3jfO7CBkMdpyHZMD18BtKgZFQtREPOSLOHOwnAKnWUP
 EX83pqLqSMO61AeXTLcvSozmK4ZgA9DsfzwvtPATyWIekoSZKTVJnhCInEp5lGo8esNtsua.IdH6
 g4QNsqwnbC7NP3rw762GgiAEtC2cbTKwHEwcrdmSViBO7PoMqEO7K_NsHvGW.bhUjJj4sP5FNoxT
 NpCv3z1zMRV_Ff6wtjye0ZmH65uNPpR.8.7DNMhV8pIU7vnFvsQl4kpJKm2Ae_.UwNArdv.tAMtW
 6IiRV0tGPyHoVMDBJ1oc3MNnr4SC7XThQ92FkzZiqGsGDlGQqrgOgSvsK.ZiitcGzf.3LnMeWswD
 G2mMsm7gv5DlFz8BnCzgXlArdm9_mzNu3kXMdI_4r6G7ylzN9.bAkuh_TzFamXzfwhEPHViaoBjI
 5l..IBnzlqZ9vKQph3ocaKhSwrp_ypg8FqzTb5Z6POOdWdKlw.H2bNh383CbCIreN2ChZRrZP9d3
 bKB9wMWtZBOA.MhyRiqt9.iI6gJM2kkmuq3pLlQGjwf6E2rDp51PWma7NjfuQraJ38pAVlH3t02F
 V6p8oJVSZvbTGa57GWvGbPev683BKEmVdSJ2yEeXfDOhodOdNR16EVijCcrD5NEGJFNBl7U_ViEP
 5XnC5hZNW_AbOBH0Ahlh7JdaClgKVD3YNHHG2q.4ykcvuHEGZiHeEqH5qJ6i_uBix0xRhHHvIhzq
 H53gAKi1yty9RQUNlZMZDyZUhnSk.d_2MLFBMDtnISj2C04FO7b6Y9mD.zfH2rSBsQdwJM0HWgoU
 RYTvYLK7dCbQm2_199xd01JcOtkfT1i7e6hmRE9PuNbjl3A5b.Pg_77mfpH5O0_skqhmFfclHm8U
 snuwogGGiLEOqi1c_MCynfZjxwENLLGRGwJJwPAH96Mp0nEuAxizT2bDFk.9zTjoaxItNf.jn6TV
 1SsLLUm60IYRRBK8JUDqwSWwLeDG47Vkmo1H2WqXxlGS9_4dkFkcmKnOEuWGE0_Mqxfi15qYaRoi
 hZiwSsFHyAjawXy6JSp3On9YcxkUljmjfF8NjmB1clVk8hsXpNcXiEJSbrrgxAherXMQyRgkmde7
 jT77mkmAwBipKc4HGY2Crjxu8bmHEpkHuDVSV.oWQbxAVS8DSgptSNHcDafndZyIwSsJQfSyHF4H
 HXwY9pbTU1gDg4InmcpPnWRLxrO94p8Z76Msczl7MLPI1T7EtTi0eaJspJKGvqcE-
X-Sonic-MF: <abdul.rahim@myyahoo.com>
X-Sonic-ID: e76e49aa-2261-4d83-bb69-b1c751c7bbf5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.sg3.yahoo.com with HTTP; Sun, 22 Sep 2024 23:08:48 +0000
Received: by hermes--production-sg3-fc85cddf6-kzxtv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7a694d7ff6fbf021b26f5be229f8bfcd;
          Sun, 22 Sep 2024 22:58:34 +0000 (UTC)
From: Abdul Rahim <abdul.rahim@myyahoo.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	shuah@kernel.org
Cc: Abdul Rahim <abdul.rahim@myyahoo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftest: alsa: check if user has alsa installed
Date: Mon, 23 Sep 2024 04:28:18 +0530
Message-ID: <20240922225824.18918-1-abdul.rahim@myyahoo.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240922225824.18918-1-abdul.rahim.ref@myyahoo.com>

Currently, if alsa development package is not installed on the user's
system then the make command would print a `pagefull` of errors. In
particular one error message is repeated 3 times. This error is returned
by `pkg-config` and since it is not being handeled appropriately,
repeated calls to `pkg-config` prints the same message again.

This patch adds check for alsa package installation. If alsa is not
installed, a short and consize error is returned. Also, it does not
affect the compilation of other tests.

Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
---

Current output:
```
make[3]: Entering directory '/mnt/ubuntu/abdul_linux/mainline_dev/tools/testing/selftests/alsa'
Makefile:4: *** Package alsa not found, please install alsa development package or add directory containing `alsa.pc` in PKG_CONFIG_PATH.  Stop.
make[3]: Leaving directory '/mnt/ubuntu/abdul_linux/mainline_dev/tools/testing/selftests/alsa'
make[3]: Entering directory '/mnt/ubuntu/abdul_linux/mainline_dev/tools/testing/selftests/amd-pstate'
```

Previous output:
```
make[3]: Entering directory '/mnt/ubuntu/abdul_linux/mainline_compile/tools/testing/selftests/alsa'
Package alsa was not found in the pkg-config search path.
Perhaps you should add the directory containing `alsa.pc'
to the PKG_CONFIG_PATH environment variable
Package 'alsa', required by 'virtual:world', not found
Package alsa was not found in the pkg-config search path.
Perhaps you should add the directory containing `alsa.pc'
to the PKG_CONFIG_PATH environment variable
Package 'alsa', required by 'virtual:world', not found
Package alsa was not found in the pkg-config search path.
Perhaps you should add the directory containing `alsa.pc'
to the PKG_CONFIG_PATH environment variable
Package 'alsa', required by 'virtual:world', not found
gcc  -isystem /mnt/ubuntu/abdul_linux/mainline_compile/usr/include -L/mnt/ubuntu/abdul_linux/mainline_compile/tools/testing/selftests/alsa       -Wl,-rpath=./ -D_GNU_SOURCE=  -shared -fPIC conf.c  -lasound -lpthread -o /mnt/ubuntu/abdul_linux/mainline_compile/tools/testing/selftests/      alsa/libatest.so
In file included from conf.c:18:
alsa-local.h:11:10: fatal error: alsa/asoundlib.h: No such file or directory
   11 | #include <alsa/asoundlib.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [Makefile:24: /mnt/ubuntu/abdul_linux/mainline_compile/tools/testing/selftests/alsa/libatest.so] Error 1
```

 tools/testing/selftests/alsa/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index 25be68025290..944279160fed 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 #
+ifneq ($(shell pkg-config --exists alsa && echo 0 || echo 1),0)
+$(error Package alsa not found, please install alsa development package or \
+	add directory containing `alsa.pc` in PKG_CONFIG_PATH)
+endif
 
 CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
 LDLIBS += $(shell pkg-config --libs alsa)
-- 
2.46.0

