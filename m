Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7121F78E6
	for <linux-sound@vger.kernel.org>; Sun,  6 Sep 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788729401; cv=none; b=Nkcr3l7zpDyiyp1RHsyB3/SMLWvPWlNs/ZF9tXtUf2RjYunGel1VMcm8pUqOPm/XGmT8nqMPPd41bNpSA72oOgzKiJvgs19yQATxG7RZD7ToIpzL50RPo9WexIcK5U7DQ9JEB3t2v5oT70T7ByWUjxZqLTOJLd/bvMoBDT/SY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788729401; c=relaxed/simple;
	bh=T6ocn1JWdhASinRJLlDLsIIvJTzgx+9tM78ayJVP1qU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TRUmvDlXVGRuKLtSvWytgjYOB5yL/Ujh/DEg/od4Da0QMlW+Tr9bFHYbioZCmN+lSo1ACyHyVx1osuPyN1oejASG62QQNob3yI8BfcH+ia26OfShUrHaJL062YVilJvAbdcHtB3T5Tf51JVhGJfJ2uoscAroThyQRWYwXjecI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=L7z5b/Uf; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="L7z5b/Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788729395; x=1788988595;
	bh=T6ocn1JWdhASinRJLlDLsIIvJTzgx+9tM78ayJVP1qU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=L7z5b/UfZ3f8l8gWRY+zQEqhIcQ737Iu5X1O5nI/NA/h5uBfO5YvWXBJX0qWi1DKu
	 LJXknOPV5GjQMOq5eYHSxcOjf720Q/PzqppzcpgyHY+zaMSUzHzr01lvugRGusAbvq
	 tf4INuKWEwv3EKqKIKFzuGR2OVy1cm88zXtgTl7ms8PDKZzMKQh8SOhwTx4OFsvdYY
	 5UlyFn0RiiP0pffoVLcHqigKALVuY53tbLd3+fCdF3zaSv5WR5sg9YE6a9/R8AxmXq
	 jKAa8o7uxvfEGxZFOqsQ3TXmiUCj38muEJv9TRHugiySCzpsFXENAOjm/AXlf4hB7i
	 FhVRyCz0JsUzg==
Date: Sun, 06 Sep 2026 21:16:32 +0000
To: linux-sound@vger.kernel.org
From: "KM.Plass" <kmplass@pm.me>
Cc: sbinding@opensource.cirrus.com, tiwai@suse.de
Subject: BUG] cs35l41-hda: OTP_BOOT_DONE timeout / I2C lost arbitration persists independent of bus speed (Lenovo Legion Slim 7 16APH8, BIOS M1CN48WW)
Message-ID: <e93b780f-2989-4353-9316-71df451f7da7@pm.me>
Feedback-ID: 179145053:user:proton
X-Pm-Message-ID: 0e0446710a5cde280a7ffc06e0efd12766408eec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi there.

System information
Machine: Lenovo Legion Slim 7 16APH8 (82Y4), AMD Ryzen 7 7840HS
BIOS version: M1CN48WW
Kernel: 7.0.0-31-generic (Ubuntu)
ACPI subsystem ID reported by driver: 17AA38B7
Audio codec: cs35l41-hda (I2C, ACPI HID "CSC3551"), 2 amplifiers at I2C=20
addresses 0x40 and 0x41 on _SB.I2CD (i2c-designware controller instance=20
AMDI0010:03)
Symptom

Both amplifier instances fail probe with:

cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed waiting for OTP_BOOT_DONE
cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: probe with driver cs35l41-hda=20
failed with error -11
cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Failed waiting for OTP_BOOT_DONE
cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: probe with driver cs35l41-hda=20
failed with error -11

occurring at the exact same timestamps as:

i2c_designware AMDI0010:03: i2c_dw_handle_tx_abort: lost arbitration

(repeated ~30 times within a few milliseconds, matching the probe attempts)=
.

Internal speakers remain silent; headphones and Bluetooth audio work=20
normally, isolating the problem to the internal CS35L41 amplifiers.

Background: a known fix for this exact SSID does not resolve the issue=20
on this BIOS revision

A community-documented DSDT workaround exists for this exact model and=20
subsystem ID (17AA38B7) on an earlier BIOS revision (M1CN42WW): lowering=20
the I2C bus speed for both amplifiers from 1 MHz to 400 kHz in the DSDT=20
resolves the "lost arbitration" failure there. Reference:=20
https://forum.garudalinux.org/t/fix-lenovo-legion-slim-7-16aph8-82y4-silent=
-speakers-on-linux-cs35l41-at-400-khz/48722

On BIOS M1CN48WW this fix does NOT resolve the issue. I tested all of=20
the following I2C bus speeds by patching the DSDT (I2cSerialBusV2=20
resources for both 0x40 and 0x41 on _SB.I2CD) and loading the modified=20
table via the kernel's initrd ACPI table-upgrade mechanism (confirmed=20
successfully loaded via ACPI: DSDT ACPI table found in initrd,=20
CONFIG_ACPI_TABLE_UPGRADE=3Dy):

1 MHz (0x000F4240) - original firmware value - fails
400 kHz (0x00061A80) - matches the published M1CN42WW fix - fails=20
identically
100 kHz (0x000186A0) - the speed the i2c-designware driver itself=20
already force-downgrades AMDI0010:00 to, logged as "known not-working"=20
at 400 kHz on that other bus instance - fails identically

All three speeds produce the exact same "lost arbitration" and "Failed=20
waiting for OTP_BOOT_DONE" errors at the same point in boot. This=20
strongly suggests I2C clock speed is not the (sole) root cause on this=20
particular BIOS/board revision.

Kernel-side configuration checked

The cs35l41_hda_property.c table entry for this SSID appears correct:

{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=20
-1, 0, 0, 0 },

reset_gpio_index =3D 0 correctly maps to the only GpioIo resource with=20
IoRestrictionOutputOnly (ACPI pin 0x0082) among the GPIO resources=20
appended to the device's _CRS (the SPK1 device has no _DSD at all; full=20
_CRS excerpt below).

/sys/kernel/debug/gpio confirms this pin (#130) has already been claimed=20
as an output by some consumer (shown as output with state low), so GPIO=20
acquisition itself does not appear to be failing. dmesg contains no=20
"Unable to get" / gpiod error messages related to this device or HID.

I was not able to determine, from userspace logs alone, whether the=20
reset line is toggled with correct timing relative to the first I2C=20
transaction (assertion duration / settle time before the driver attempts=20
to talk to the amp) - this would require kernel-side GPIO tracing or a=20
hardware logic analyzer, which I don't have access to.

Relevant ACPI _CRS excerpt (Device SPK1, decompiled DSDT)
Method (_CRS, 0, NotSerialized)
{
 =C2=A0 =C2=A0 Name (IBUF, ResourceTemplate ()
 =C2=A0 =C2=A0 {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2cSerialBusV2 (0x0040, ControllerInitiated, 0=
x000F4240,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressingMode7Bit, "\_SB.I2CD",=
 0x00, ResourceConsumer, ,=20
Exclusive, )
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2cSerialBusV2 (0x0041, ControllerInitiated, 0=
x000F4240,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressingMode7Bit, "\_SB.I2CD",=
 0x00, ResourceConsumer, ,=20
Exclusive, )
 =C2=A0 =C2=A0 })
 =C2=A0 =C2=A0 Return (ConcatenateResTemplate (IBUF, GPIA))
}

Name (GPIA, ResourceTemplate ()
{
 =C2=A0 =C2=A0 GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOu=
tputOnly,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0=
082 }
 =C2=A0 =C2=A0 GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionIn=
putOnly,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0=
055 }
 =C2=A0 =C2=A0 GpioIo (Shared, PullUp, 0x0064, 0x0000, IoRestrictionInputOn=
ly,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0=
05A }
 =C2=A0 =C2=A0 GpioInt (Edge, ActiveLow, Shared, PullNone, 0x0064,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0=
05A }
})
Attachments to include when submitting
Full dmesg output from a boot with the original (1 MHz) DSDT
Full dmesg output from a boot with the 400 kHz DSDT test
Full dmesg output from a boot with the 100 kHz DSDT test
Full decompiled DSDT (iasl -d dsdt.aml) or at least the complete SPK1=20
device block plus the _SB.I2CD scope
Question for maintainers

Is there a known timing/sequencing difference for CS35L41 reset handling=20
on M1CN48WW (or in general for this board's GPIO controller / AMDI0010=20
revision) that could cause "lost arbitration" independent of I2C clock=20
speed? Could this point to an incorrect reset assertion duration or=20
settle time rather than clock speed, and if so, is this adjustable from=20
DSDT/userspace, or would it require a driver change (e.g. an additional=20
delay after deasserting reset before the first OTP_BOOT_DONE poll)?

Happy to provide any additional logs, test patches, or run further tests=20
on this hardware.

BTW: I'm not into computing, just tried to solve that problem using Claude.


